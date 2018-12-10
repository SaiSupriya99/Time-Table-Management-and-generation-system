from django.shortcuts import render,redirect
from django.db import connection,transaction
from django.http import HttpResponse,Http404
from .models import * 
from django.db import connections
from datetime import timedelta,date
import datetime
import requests
import random
from django.contrib.auth import authenticate, login as auth_login,logout
from django.contrib.auth.decorators import login_required
from collections import OrderedDict
import collections
# from .decorators import faculty_required


#added--------------------------------------------------------------------------------------------
from rest_framework import generics

from . import serializers
from rest_framework.response import Response
from django.http import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view
# users/views.py
from rest_framework import generics
from datetime import datetime
# users/views.py
#from django.http import JsonResponse
from .serializers import timetableSerializer
from django.views.decorators.csrf import csrf_exempt
#--------------------------------------------------------------------------------------------------


def index(request):
	return render(request,'timetable/home.html')

@login_required(login_url='/')
def home(request):
	user = request.user
	if user.user_type == 1:
		context=StudentNotifications(request)
		print(context)
		return render(request,'timetable/studentindex.html',context)
	elif user.user_type == 2:
		context=FacultyNotifications(request)
		print(context)
		return render(request,'timetable/facultyindex.html',context)
	else:
		context=AdminNotifications(request)
		print(context)
		return render(request,'timetable/adminindex.html',context)


@login_required(login_url='/')
def logout_user(request):
  logout(request)
  return redirect('/')



def student_login(request,token_id):
	payload={'token':token_id,'secret':"3dfb05286cdf7816b11160b70242f2c27546781ea74ade858ddebdacf92c5dd78bd4850d2740b9e8d3c36868ad110a73dc63e06406246f47edc0af18152bb49b"}
	url="https://serene-wildwood-35121.herokuapp.com/oauth/getDetails"
	response=requests.post(url,data=payload)
	data=response.json()
	data=data['student']
	print(data)
	try:
		user_object = User.objects.get(email=data[0]['Student_Email'])
	except:
		user_object=User()
	user_object.first_name=data[0]['Student_First_Name']
	user_object.last_name=data[0]['Student_Last_name']
	user_object.email=data[0]['Student_Email']
	user_object.token=token_id
	user_object.is_active = True
	user_object.set_unusable_password()
	user_object.save()
	query=Student.objects.raw('SELECT student_id,user_id FROM timetable_student where user_id=%s',[user_object.id])
	arr=[]
	for i in query:
		arr.append(i.user_id)
	#print(len(arr))
	if len(arr)==0:
		student_object=Student()
		student_object.user_id=user_object.id
		student_object.student_id=data[0]['Student_ID']
		student_object.save()
	#print(user_object.id)
	auth_login(request, user_object)
	return redirect(home)

def authority_login(request):
	if request.method == 'POST':
		email=request.POST.get('email')
		password=request.POST.get('pwd')
		print(email,password)
		user_object = authenticate(email=email,password=password)
		print(user_object)
		if user_object!=None:
			if user_object.user_type == 2 or user_object.user_type == 3:
				auth_login(request, user_object)
				if user_object.user_type == 2:
					return redirect(home)
				else:
					return redirect(home)
			else:
				return redirect(user_login)
		else:
			context={'error':"* Invalid UserName/Password"}
			return render(request,'timetable/login.html',context)
	return render(request,'timetable/login.html')

def register(request):
	if request.method == 'POST':
		first_name = request.POST['first_name']
		last_name = request.POST['last_name']
		email = request.POST['email']
		password = request.POST['pwd']
		typ = int(request.POST['typ'])
		user_object=User()
		user_object.email = email
		user_object.set_password(password)
		user_object.user_type = typ
		user_object.first_name = first_name
		user_object.last_name = last_name
		user_object.save()
		if typ == 2:
			faculty_obj = faculty()
			faculty_obj.user=user_object
			faculty_obj.save()
		auth_login(request, user_object)
		return redirect(home)
	return render(request,'timetable/register.html')

def FacultyNotifications(request):
		fid=request.user.faculty.fid
		current_date = datetime.date.today()
		cursor=connection.cursor()
		cursor.execute("select date from timetable_faculty_meetings;")
		result=cursor.fetchall()
		schedule_date=[]
		schedule_msg=""
		for i in result:
			schedule_date.append(i[0])
		for k in schedule_date:
			if k >= current_date:
				schedule_msg="There are new Scheduled Meetings"
				break
		print(schedule_msg)
		A=DP(request)
		print(A)
		cursor.execute("select c_name_id from timetable_criteria_ta;")
		result1=cursor.fetchall()
		criteria_courses=[]
		criteria_msg=""
		for i in result1:
			criteria_courses.append(i[0])
		print(criteria_courses)
		for k in A:
			if k not in criteria_courses:
				criteria_msg="Enter the Criteria for the allocation of Teaching's Assistant(TA) for your Courses"
				break
		print(criteria_msg)
		context={'schedulemsg':schedule_msg,'criteriamsg':criteria_msg}
		return context
	
def AdminNotifications(request):
	current_date=datetime.date.today()
	cursor=connection.cursor()
	cursor.execute("select distinct(c_name_id) from timetable_criteria_ta;")
	result=cursor.fetchall()
	criteria_courses=[]
	for i in result:
		criteria_courses.append(i[0])
	print(criteria_courses)
	cursor.execute("select distinct(c_name_id) from timetable_ta_alloc;")
	result2=cursor.fetchall()
	taalloc_courses=[]
	for i in result2:
		taalloc_courses.append(i[0])
	print(taalloc_courses)
	for i in taalloc_courses:
		criteria_courses=[x for x in criteria_courses if i not in x]
	print(criteria_courses)
	msg=""
	if(len(criteria_courses)!=0):
		msg="You have to allocate TA's for the courses "
	context={'cnames':criteria_courses,'msg':msg,'length':len(criteria_courses)}
	return context

def StudentNotifications(request):
	sid=request.user.student.student_id;
	current_date = datetime.date.today()
	cursor=connection.cursor()
	print("sid",sid)
	cursor.execute("select c_name_id from timetable_student_course where student_id_id='%s';" %(sid))
	result=cursor.fetchall()
	student_courses=[]
	course=[]
	#print("result:",result)
	for i in result:
		student_courses.append(i[0])
	#print(student_courses)
	cursor.execute("select distinct(c_name) from timetable_schedule_history;")
	result1=cursor.fetchall()
	for i in result1:
		course.append(i[0])
	#print(course)
	class_reschedule=[]
	for k in student_courses:
		#print(k)
		if k in course:
			#print("k:",k)
			cursor.execute("select present_date from timetable_schedule_history where c_name='%s';"%(k))
			result2=cursor.fetchall()
			dates=[]
			for j in result2:
				dates.append(j[0])
			#print("dates:",dates)
			reschedule_msg=""
			for h in dates:
				if h >= current_date:
					cursor.execute("select c_name,present_date,resc_date from timetable_schedule_history where present_date='%s' and c_name='%s';"%(h,k))
					result3=cursor.fetchall()
					reschedule_class=[]
					for g in result3:
						reschedule_class.append(g[0])
						reschedule_class.append(g[1])
						reschedule_class.append(g[2])
					#print("rescheduled class:",reschedule_class)
					reschedule_msg="Your '%s' Class is Rescheduled from %s to %s"%(reschedule_class[0],reschedule_class[1],reschedule_class[2])
					break
			class_reschedule.append(reschedule_msg)
	#print("msg:",class_reschedule)
	cursor.execute("select date from timetable_event;")
	result4=cursor.fetchall()
	event_dates=[]
	event_msg=""
	for i in result4:
		event_dates.append(i[0])
	for c in event_dates:
		if c >= current_date:
			cursor.execute("select name,date from timetable_event where date='%s'"%(c))
			result5=cursor.fetchall()
			event_name=[]
			for l in result5:
				event_name.append(l[0])
				event_name.append(l[1])
			event_msg="There is a new Event '%s' Scheduled on %s"%(event_name[0],event_name[1])
			break
	cursor.execute("select c_name_id from timetable_ta_alloc where student_id_id='%s'"%(sid))
	result6=cursor.fetchall()
	tamsg=""
	allocateta=[]
	for i in result6:
		allocateta.append(i[0])
	if(len(allocateta)!=0):
		tamsg="User are Allocated as a TA for course '%s'"%(allocateta[0])
	context={'rescheduleclass':class_reschedule,'eventmsg':event_msg,'tamsg':tamsg}
	return context

def student_freeslots(request):
	C=searchsf(request)
	if request.method == 'POST':
		if request.POST.get('student_id'):
			cursor=connection.cursor()
			date1=request.POST.get('txtDate')
			Studentid=request.POST.get('student_id')
			year,month,day=(int(x) for x in date1.split('-'))
			a=datetime.date(year,month,day)
			t=a.strftime("%A")
			#print("t:",t)
			Q="""SELECT slot_no_id,c_name_id FROM timetable_timetable WHERE day='%s'"""%(t)
			cursor.execute(Q)
			L=cursor.fetchall()
			#cursor.execute("SELECT student_course.student_id,timetable.slot_no FROM timetable INNER JOIN  student_course ON student_course.c_name=timetable.c_name where  timetable.day='%s';" %(t))
			#s3=cursor.fetchall()
			A=[1,2,4,5,7,8,9,10,11]
			c=[]
			cursor.execute("SELECT c_name_id from timetable_student_course where student_id_id='%s';"%(Studentid))
			d=cursor.fetchall()
            #print("hhhhhh",d)
			for n in d:
				for m in L:
					if(n[0]==m[1]):
						c.append(m[0])
                                      
            #print(c)
               # print("free slots of student")
			for w in c:
				if w in A:
					A.remove(w)
            #print(A)
			cursor.execute("SELECT * FROM timetable_slot_timings")
#print("slot_timings:")
			SlotTime=cursor.fetchall()
#for i in SlotTime:
 #       print(i)
#print("free slot_timing will be displayed")
			c1=[]
			for n in A:
				for m in SlotTime:
					if(n==m[0]):
						c1.append(str(m[1])+"-"+str(m[2]))
                        
			print(c1)

			
			connection.commit()
			connection.close()
			context={'freeslots':c1}
			return render(request,'timetable/freeslots_student.html',context)
	else:
			return render(request,'timetable/searchsf.html',{'students':C})

def searchsf(request):
	C=[]
	crsr=connection.cursor()
	fid2=request.user.faculty.fid;
	crsr.execute("select student_id_id from timetable_faculty_students where fid_id='%d';" %(fid2))
	result=crsr.fetchall()
	print(result);
	for i in result:
		C.append(i[0])
	print(C)
	return C

def FacultyNames(request):
	C=[]
	crsr=connection.cursor()
	sid=request.user.student.student_id;
	print("sid",sid)
	crsr.execute("select c_name_id from timetable_student_course where student_id_id='%s';" %(sid))
	result=crsr.fetchall()
	print("result",result)
	for i in result:
		C.append(i[0])
	total=[]
	for j in C:
		crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';"%(j))
		result1=crsr.fetchall()
		print("result1",result1)
		crsr.execute("select user_id from timetable_faculty where fid='%d';"%(result1[0][0]))
		result2=crsr.fetchall()
		print("result2",result2)
		crsr.execute("select first_name,last_name from timetable_user where id='%d';"%(result2[0][0]))
		result3=crsr.fetchall()
		print("result3",result3)
		name=[]
		name.append(str(result3[0][0])+' '+str(result3[0][1]))
		total.append(name)
	print("total",total)
	return total	

def Faculty_freeslots(request):
	total=FacultyNames(request)
	print(request)
	if request.method == 'POST':
		if request.POST.get('f_name'):
			current_student=request.user.id
			print(current_student)
			cursor=connection.cursor()
			cursor.execute("SELECT student_id from timetable_student where user_id='%d'"%(current_student))
			result=cursor.fetchall()
			print(result)
			cursor.execute("SELECT c_name_id from timetable_student_course where student_id_id='%s'"%(result[0][0]))
			result=cursor.fetchall()
			courses=[]
			for course in result:
				courses.append(course[0])
			print(courses)
			fname=request.POST.get('f_name')
			eventdate=request.POST.get('txtDate')
			print(eventdate)
			year,month,day=(int(x) for x in eventdate.split('-'))
			a=datetime.date(year,month,day)
			t=a.strftime("%A")
			r=""
			Query="""SELECT slot_no_id,c_name_id FROM timetable_timetable WHERE day='%s'"""%(t)
			cursor.execute(Query)
			L=cursor.fetchall()
			print("L:",L)
			#for k in L:
				#if(t==k[0]):
					#query="""SELECT slot_no_id,c_name_id FROM a13_timetable WHERE day='%s'"""%(t)
					#cursor.execute(query)
					#r=cursor.fetchall()
			#print("r:",r)
			cursor.execute("SELECT timetable_faculty.user_id,timetable_faculty.fid,timetable_faculty_course.c_name_id FROM timetable_faculty INNER JOIN timetable_faculty_course ON timetable_faculty_course.fid_id=timetable_faculty.fid")
			s4=cursor.fetchall()
			#print("s4:",s4)
			A=[1,2,4,5,7,8,9,10,11]
			c=[]
			c1=[]
			a=[]
			for g in s4:
				for y in L: 
					if(g[2]==y[1]):
						c=[]
						c.append(g[0])
						c.append(y[0])                        
						t=tuple(c)
						a.append(t)
#print("facultyname and scheduled slot",a)
			for p in a:
				cursor.execute("SELECT first_name,last_name from timetable_user where id='%d'"%(p[0]))
				sql=cursor.fetchall()
				print(sql)
				facultyname=str(sql[0][0])+' '+str(sql[0][1])
				if(fname==facultyname):
					c1.append(p[1])
#print("scheduled slots of faculty",c1)
                

#print("free slots of faculty")
			for w in c1:
				if w in A:
					A.remove(w)
#print(A)
			cursor.execute("SELECT * FROM timetable_slot_timings")
#print("slot_timings:")
			SlotTime=cursor.fetchall()
#for i in SlotTime:
 #       print(i)
			#print("free slot_timing will be displayed")
			c2=[]
			c3=[]
			for n in A:
				for m in SlotTime:
					if(n==m[0]):
						c2.append(str(m[1])+"-"+str(m[2]))

			#print("c2:",c2)
			
			connection.commit()
			connection.close()
			context={'slottime':c2,'courses':courses}
			return render(request,'timetable/ffs.html',context)
	else:
			return render(request,'timetable/freeslots_faculty.html',{'fnames':total})

def Name_Event():
	B=[]
	crsr=connection.cursor()
	#fid2=request.user.faculty.fid;
	#crsr.execute("select c_name_id from timetable_faculty_course where fid_id='%d';" %(fid2))
	crsr.execute("select name from timetable_event;")
	result=crsr.fetchall()
	print(result);
	for i in result:
		B.append(i[0])
	print(B)
	return B


def SearchEvent(request):
	crsr=connection.cursor();
	B=Name_Event()
	if request.method == 'POST':
		if request.POST.get('event_name'):
			eventname=request.POST.get('event_name')
			print(eventname)
			#sql=event.objects.raw('SELECT id,date,day,event_type,name FROM timetable_event where name=%s',[eventname])
			crsr.execute("SELECT id,date,day FROM timetable_event where name='%s';"%(eventname))
			ans33=crsr.fetchall()
			w=[]
			for g in ans33:
				r=[]
				r.append(g[1])
				r.append(g[2])
				w.append(r)
			context={'eventdate':w,'ename':eventname}
			print(w)
			return render(request,'timetable/EventDate.html',context)
	else:
		return render(request,'timetable/Events.html',{'eventname':B})

def timetableg(request):
	return render(request,'timetable/TimetableG.html')


def timetableview(request):
	return render(request,'timetable/viewTimetableG.html')

def view_classtimetable(request):
		cursor=connection.cursor()
		cursor.execute("select day,slot_no_id,c_name_id,rid from timetable_timetable order by FIELD(day,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),slot_no_id;")
		result=cursor.fetchall()
		r=[]
		wp=OrderedDict()
		for i in result:
			y=[]
			if i[0] not in wp:
				wp[i[0]]=[]
			y.append(i[1])
			y.append(i[2])
			y.append(i[3])
			wp[i[0]].append(y)
		print(wp)
		#day=collections.defaultdict()
		day=OrderedDict()
		for i in result:
			u=[]
			if i[0] not in day:
				day[i[0]]={}
			if i[1] not in day[i[0]]:
				day[i[0]][i[1]]=[]
			u.append(i[2])
			u.append(i[3])
			#slot[i[1]].append(u)
			day[i[0]][i[1]].append(u)
		print(day)
		#print("slot:",slot)
		context={'classes':wp}
		return render(request,'timetable/viewclass.html',context)

def view_examtimetable(request):
	A=Types_Exam(request)
	if request.method == 'POST':
		if request.POST.get('exam_type'):
			exam_type=request.POST.get('exam_type')
			cursor=connection.cursor()
			cursor.execute("select count(*) from timetable_exam where exam_type='%s';"%(exam_type))
			row_count=cursor.fetchall()
			rowcount=row_count[0][0]
			print('rowcount',rowcount)
			if rowcount!=0:
				sql10=exam.objects.raw('select id,date,slot_no,c_name_id from timetable_exam where exam_type=%s order by date,slot_no',[exam_type])
				wp=OrderedDict()
				for ij in sql10:
					u=[]
					if str(ij.date) not in wp:
						wp[str(ij.date)]=[]
					#u.append(ij.slot_no)
					sql11=exam_slot.objects.raw('select id,start_time,end_time from timetable_exam_slot where exam_type=%s and slot_no=%s',[exam_type,ij.slot_no])
					for gh in sql11:
						u.append(gh.start_time)
						u.append(gh.end_time)
					u.append(ij.c_name_id)
					wp[str(ij.date)].append(u)
				print(wp)
				context={'examdates':wp,'examtype':exam_type}
				return render(request, 'timetable/viewexamlist.html',context)
			else:
				context={'msg':"Exam TimeTable is not Scheduled"}
				return render(request,'timetable/notExam.html',context)
	else:
		return render(request,'timetable/viewExam.html',{'examtypes':A})

def Types_Exam(request):
	A=[]
	crsr=connection.cursor()
	crsr.execute("select distinct(name) from timetable_almanac where event_type='E';")
	temp33=crsr.fetchall()
	print(temp33);
	for i in temp33:
		A.append(i[0])
	print(A)
	return A

def examT(request):
	A=Types_Exam(request)
	if request.method == 'POST':
		if request.POST.get('exam_type'):
			exam_type=request.POST.get('exam_type')
			cursor=connection.cursor()
			cursor.execute("select count(*) from timetable_exam where exam_type='%s';"%(exam_type))
			row_count=cursor.fetchall()
			rowcount=row_count[0][0]
			print('rowcount',rowcount)
			if rowcount==0:
				
				sql=exam_slot.objects.raw('SELECT id,slot_no from timetable_exam_slot where exam_type=%s',[exam_type])
				slot=[]
				for hy in sql:
					slot.append(hy.slot_no)
				#print("slot:",slot)
				min_exams=2
				sql1=exam_slot.objects.raw('SELECT id,date FROM timetable_almanac where name=%s',[exam_type])
				dates=[]
				for ty in sql1:
					dates.append(ty.date)
				#print("dates:",dates)
				sql2=course.objects.raw('SELECT cid,c_name FROM timetable_course order by cid')
				courses=[]
				e='ASE_11'
				e1='APT'
				for cy in sql2:
					courses.append(cy.c_name)
				courses=[x for x in courses if e not in x]
				courses=[x for x in courses if e1 not in x]
				print("courses:",courses)
				exam_slots=[]
				i=0
				for p in dates:
					for j in slot:
					    w=[]
					    w.append(p)
					    w.append(j)
					    w.append(courses[i])
					    exam_slots.append(w)
					    i=i+1
				print("exam slots:",exam_slots)
				if i<len(courses):
					for p in dates:
					    for j in slot:
					        if i<len(courses):
					            w=[]
					            w.append(p)
					            w.append(j)
					            w.append(courses[i])
					            exam_slots.append(w)
					            i=i+1
				print("final exam_slots:",exam_slots)
				array=[]
				for p in dates:
					B=[]
					for k in exam_slots:
					    if p in k:
					        B.append(k)
					#-print("slots_in_one_date:",B)
					for j in slot:
					    o=[]
					    for l in B:
					        if j in l:
					            o.append(l)
					    #-print("one_slot_in_one_day:",o)
					    if(len(o)<=min_exams):
					        if(len(o)==min_exams):
					            sql3=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[o[0][2]])
					            stulist1=[]
					            for ey in sql3:
					                stulist1.append(ey.student_id_id)
					            #-print("st1,course:",stulist1,o[0][2])
					            sql4=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[o[1][2]])
					            stulist2=[]
					            for ey2 in sql4:
					                stulist2.append(ey2.student_id_id)
					            #-print("st2,course:",stulist2,o[1][2])
					            cnt=0
					            for g in stulist1:
					                if g in stulist2:
					                    cnt=cnt+1
					            if(cnt>0):
					                s=o[1][2]
					                #-print("s:",s)
					                exam_slots=[x for x in exam_slots if s not in x]
					                B=[x for x in B if s not in x]
					                o=[x for x in o if s not in x]
					                array.append(s)
					        if(j>=2):
					            op=[]
					            slotno=j-1
					            slotno1=j-2
					            #-print("j:",j)
					            for m in B:
					                if ((slotno in m) or (slotno1 in m)):
					                    op.append(m[2])
					            #-print("op:",op)
					            for val in o:
					                #-print("val",val)
					                sql5=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[val[2]])
					                st=[]
					                for qy in sql5:
					                    st.append(qy.student_id_id)
					                #-print("stj:",st)
					                for jl in op:
					                    #-print("jl:",jl)
					                    sql6=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[jl])
					                    st1=[]
					                    for qy2 in sql6:
					                        st1.append(qy2.student_id_id)
					                    #-print("stj1:",st1)
					                    c=0
					                    for h in st:
					                        if h in st1:
					                            c=c+1
					                    if(c>=1):
					                        s1=val[2]
					                        #-print("s1:",s1)
					                        exam_slots=[x for x in exam_slots if s1 not in x]
					                        #print("removing exam_slots:",exam_slots)
					                        B=[x for x in B if s1 not in x]
					                        #print("after removing B:",B)
					                        array.append(s1)
					                        break
				print("array:",array)
				while(array):
					mn=array[0]
					sql7=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[mn])
					slist=[]
					for wy in sql7:
					    slist.append(wy.student_id_id)
					#print("slist:",slist)
					flag=0
					for p in dates:
					    for j in slot:
					        pr=[]
					        for k in exam_slots:
					            if((j in k) and (p in k)):
					                pr.append(k)
					        if(len(pr)<min_exams):
					            cnt=0
					            if(len(pr)>0):
					                sql8=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[pr[0][2]])
					                slist1=[]
					                for wy1 in sql8:
					                    slist1.append(wy1.student_id_id)
					                for gi in slist:
					                    if gi in slist1:
					                        cnt=cnt+1
					            if(cnt==0):
					                ram=[]
					                for kl in exam_slots:
					                    if(((j-1 in kl) or (j-2 in kl) or (j+1 in kl) or (j+2 in kl)) and (p in kl)):
					                        ram.append(kl)
					                #print("ram:",ram)
					                jh=0
					                for ma in ram:
					                    sql9=student_course.objects.raw('SELECT id,student_id_id FROM timetable_student_course where c_name_id=%s',[ma[2]])
					                    mlist=[]
					                    for py in sql9:
					                        mlist.append(py.student_id_id)
					                    #print("mlist:",mlist)
					                    c=0
					                    for jk in slist:
					                        if jk in mlist:
					                            c=c+1
					                    if(c==0):
					                        jh=jh+1
					                #print("jh,len(ram):",jh,len(ram))
					                if(jh==len(ram)):
					                    wk=[]
					                    wk.append(p)
					                    wk.append(j)
					                    wk.append(mn)
					                    exam_slots.append(wk)
					                    array=[x for x in array if mn not in x]
					                    flag=1
					                    break
					    if(flag==1):
					        break
					#oj=oj+1
				print("after removal array:",array)
				print("final exam_slots",exam_slots)
				
				for lp in exam_slots:
					pos=exam()
					pos.date=lp[0]
					pos.slot_no=lp[1]
					pos.exam_type=exam_type
					pos.c_name_id=lp[2]
					pos.save()
				sql10=exam.objects.raw('select id,date,slot_no,c_name_id from timetable_exam where exam_type=%s order by date,slot_no',[exam_type])
				wp=OrderedDict()
				for ij in sql10:
					u=[]
					if str(ij.date) not in wp:
						wp[str(ij.date)]=[]
					#u.append(ij.slot_no)
					sql11=exam_slot.objects.raw('select id,start_time,end_time from timetable_exam_slot where exam_type=%s and slot_no=%s',[exam_type,ij.slot_no])
					for gh in sql11:
						u.append(gh.start_time)
						u.append(gh.end_time)
					u.append(ij.c_name_id)
					wp[str(ij.date)].append(u)
				print(wp)
				context={'examdates':wp,'examtype':exam_type}
				return render(request, 'timetable/examlist.html',context)
			else:
				context={'msg':"Already Exam Timetable is Scheduled"}
				return render(request,'timetable/Exam1.html',context)
	else:
		return render(request,'timetable/Exam.html',{'examtypes':A})

def DP(request):
	A=[]
	crsr=connection.cursor()
	fid2=request.user.faculty.fid
	crsr.execute("select c_name_id from timetable_faculty_course where fid_id='%d';" %(fid2))
	temp33=crsr.fetchall()
	print(temp33);
	for i in temp33:
		A.append(i[0])
	print(A)
	return A

def tacriteria(request):
	A=DP(request)
	if request.method == 'POST':
		if request.POST.get('c_name'):
			pos=criteria_ta()
			c_name = request.POST.get('c_name')
			w=[]
			cs = course.objects.get(c_name=c_name)
			#print(cs)
			w.append(request.POST.get('c_name'))
			w.append(request.POST.get('Criteria'))
			w.append(request.POST.get('Grade'))
			w.append(request.POST.get('Count'))
			pos.c_name= cs
			pos.Criteria= request.POST.get('Criteria')
			pos.Grade=request.POST.get('Grade')
			pos.Count=request.POST.get('Count')
			print(pos.Criteria,pos.Grade,pos.Count)
			#if((request.POST.get('Criteria')!="") and (request.POST.get('Grade')!="") and (request.POST.get('Count')!="")):
			pos.save()  
			context={"criteria":w}
		return render(request, 'timetable/listta.html',context)
			#else:
				#return render(request, 'timetable/error.html')
		 
	else:
		return render(request,'timetable/TA_a.html',{'courses':A})

def partoftaalloc(g,grade,cname,cgpa,tacount,course_slots,P):
	while(g>=grade):
		query1=student_grade.objects.raw('SELECT id,student_id_id,grade,c_name_id FROM timetable_student_grade where c_name_id = %s and grade=%s',[cname,g])
		r=[]
		for i in query1:
			u=[]
			u.append(i.student_id_id)
			u.append(i.grade)
			u.append(i.c_name_id)
			r.append(u)
		#print(r,len(r))
		o=[]
		for q in range(0,len(r)):
			#print(r[q][0])
			query2=Student.objects.raw('SELECT student_id,cgpa FROM timetable_student WHERE cgpa >= %s and student_id=%s', [cgpa,r[q][0]])
			k=[]
			for l in query2:	
				k.append(l.student_id)
				k.append(l.cgpa)
			#print(k)
			o.append(k)
		#print(o)
		list2 = [x for x in o if x != []]
		b=sorted(list2, key = lambda x: x[1],reverse=True)
		#print("b:",b)
		for ij in range(0,len(b)):
			query3=student_course.objects.raw('SELECT id,c_name_id FROM timetable_student_course WHERE student_id_id = %s',[b[ij][0]])
			h=[]
			for gr in query3:
				h.append(gr.c_name_id)
			#print(h)
			qw=[]
			for l in h:
				query4=timetable.objects.raw('SELECT id,slot_no_id,day FROM timetable_timetable WHERE c_name_id = %s',[l])
				n=[]
				for t in query4:
					m=[]
					m.append(t.slot_no_id)
					m.append(t.day)
					n.append(m)
				#print('n:',n)
				qw.append(n)
			#print('qw:',qw)
			c=[0,0,0]
			cnt=0
			for jl in course_slots:
				if(jl[2]>2 and jl[2]<6):
					for f in qw:
						for gh in f:
							if(jl[0]==gh[0] and jl[1]==gh[1]):
								c[jl[2]-3]=c[jl[2]-3]+1
				if(jl[2]>=6):
					for f in qw:
						for gh in f:
							if(jl[0]==gh[0] and jl[1]==gh[1]):
								cnt=cnt+1
			#print(c,cnt)
			if(cnt < 2 and c.count(1) >= 1):
				if(P<tacount):
					#print(b[ij][0])
					query6=ta_alloc.objects.raw('SELECT id,student_id_id FROM timetable_ta_alloc WHERE student_id_id= %s',[b[ij][0]])
					io=[]
					for uy in query6:
						io.append(uy.student_id_id)
					#print(len(io))
					if(len(io)==0):
						query7=Student.objects.raw('SELECT user_id,student_id FROM timetable_student where student_id=%s',[b[ij][0]])
						userid=[]
						for lu in query7:
							userid.append(lu.user_id)
						query5=User.objects.raw('SELECT id,first_name,last_name FROM timetable_user WHERE id= %s',[userid[0]])
						ri=[]
						for yt in query5:
							ri.append(b[ij][0])
							ri.append(yt.first_name)
							ri.append(yt.last_name)
						print(ri)
						pos=ta_alloc()
						if(ri[1]=='NULL'):
							ri[1]=''
						if(ri[2]=='NULL'):
							ri[2]=''
						
						pos.student_first_name=ri[1]+' '+ri[2]
						pos.c_name_id=cname
						pos.student_id_id=ri[0]
						pos.save()
						#print("P:",P,tacount)
						P=P+1
		#print("Total:",P)
		g=g-1
	return P

def Courses(request):
	A=[]
	crsr=connection.cursor()
	crsr.execute("select c_name from timetable_course;")
	result=crsr.fetchall()
	#print(result);
	for i in result:
		A.append(i[0])
	#print(A)
	crsr.execute("select distinct(c_name_id) from timetable_ta_alloc;")
	result1=crsr.fetchall()
	C=[]
	for i in result1:
		C.append(i[0])
	#print(C)
	for k in C:
		if k in A:
			A=[x for x in A if k not in x]
	return A


def taalloc(request):
	A=Courses(request)
	if request.method == 'POST':
		if request.POST.get('c_name'):
			#alloc=criteria_ta()
			cname= request.POST.get('c_name')
			result=criteria_ta.objects.raw('SELECT id,Criteria,Grade,Count FROM timetable_criteria_ta WHERE c_name_id = %s', [cname])
			print(len(result))
			if(len(result)!=0):
				grade=0
				for p in result:
					cgpa=p.Criteria
					grade=p.Grade
					tacount=p.Count
				#print(cgpa,grade,tacount)
				g=10
				course_slots=[]
				query = timetable.objects.raw('SELECT id,slot_no_id,day,class_type FROM timetable_timetable WHERE c_name_id = %s', [cname])
				#print(query.columns)
				for t in query:
					e=[]
					e.append(t.slot_no_id)
					e.append(t.day)
					e.append(t.class_type)
					course_slots.append(e)
				#print(course_slots)
				P=0
				k=partoftaalloc(g,grade,cname,cgpa,tacount,course_slots,P)
				if(k<tacount):
					print("k:",k)
					u=partoftaalloc(g,grade,cname,cgpa-1,tacount,course_slots,k)
				query2=ta_alloc.objects.raw('SELECT id,student_id_id,c_name_id FROM timetable_ta_alloc WHERE c_name_id= %s',[cname])
				r=[]
				for p in query2:
					w=[]
					w.append(p.student_id_id)
					query8=Student.objects.raw('SELECT student_id,user_id FROM timetable_student where student_id=%s',[p.student_id_id])
					userid=[]
					for it in query8:
						userid.append(it.user_id)
					query9=User.objects.raw('SELECT id,first_name,last_name FROM timetable_user where id=%s',[userid[0]])
					stname=[]
					for st in query9:
						stname.append(st.first_name)
						stname.append(st.last_name)
					w.append(str(stname[0])+' '+str(stname[1]))
					r.append(w)
				print(r)
				context={'talist':r,'coursename':cname}
				#context={'a':1}
				return render(request, 'timetable/allocateta.html',context)
			else:
				context={'msg':"Criteria is not entered by respective Faculty Yet!!"}
				return render(request,'timetable/notcriteria.html',context)  
	else:
			return render(request,'timetable/TAG.html',{'coursename':A})




def faculty_taview(request):
	A=DP(request)
	if request.method == 'POST':
		if request.POST.get('c_name'):
			cname = request.POST.get('c_name')
			result=ta_alloc.objects.raw('SELECT id,student_id_id FROM timetable_ta_alloc WHERE c_name_id= %s',[cname])
			if(len(result)!=0):
				r=[]
				for p in result:
					w=[]
					w.append(p.student_id_id)
					query8=Student.objects.raw('SELECT student_id,user_id FROM timetable_student where student_id=%s',[p.student_id_id])
					userid=[]
					for it in query8:
						userid.append(it.user_id)
					query9=User.objects.raw('SELECT id,first_name,last_name FROM timetable_user where id=%s',[userid[0]])
					stname=[]
					for st in query9:
						stname.append(st.first_name)
						stname.append(st.last_name)
					w.append(str(stname[0])+' '+str(stname[1]))
					r.append(w)
				print(r)
				context={'talist':r,'coursename':cname}
				return render(request, 'timetable/Fa_talist.html',context)
			else:
				context={'msg':"TA's are not allocated yet"}
				return render(request,'timetable/noTAs.html',context)  
	else:
			return render(request,'timetable/Faculty_Ta.html',{'cname':A})


def StudentCourses(request):
	A=[]
	crsr=connection.cursor()
	sid=request.user.student.student_id
	crsr.execute("select c_name_id from timetable_student_course where student_id_id='%s';" %(sid))
	result=crsr.fetchall()
	#print(temp33);
	for i in result:
		A.append(i[0])
	print(A)
	return A

def student_taview(request):
	A=StudentCourses(request)
	if request.method == 'POST':
		if request.POST.get('c_name'):
			cname = request.POST.get('c_name')
			result=ta_alloc.objects.raw('SELECT id,student_id_id FROM timetable_ta_alloc WHERE c_name_id= %s',[cname])
			if(len(result)!=0):
				r=[]
				for p in result:
					w=[]
					w.append(p.student_id_id)
					query8=Student.objects.raw('SELECT student_id,user_id FROM timetable_student where student_id=%s',[p.student_id_id])
					userid=[]
					for it in query8:
						userid.append(it.user_id)
					query9=User.objects.raw('SELECT id,first_name,last_name FROM timetable_user where id=%s',[userid[0]])
					stname=[]
					for st in query9:
						stname.append(st.first_name)
						stname.append(st.last_name)
					w.append(str(stname[0])+' '+str(stname[1]))
					r.append(w)
				print(r)
				context={'talist':r,'coursename':cname}
				return render(request, 'timetable/TaStudent.html',context)
			else:
				context={'msg':"TA's are not allocated yet"}
				return render(request,'timetable/noTAstudent.html',context)  
	else:
			return render(request,'timetable/Student_Ta.html',{'cname':A})

def b(request):
	return render(request,'timetable/b.html')
def RC(request):
	return render(request,'timetable/RC.html')
def users(request):
 return render(request,'timetable/users.html')
def scheduleE(request):
 return render(request,'timetable/scheduleE.html')

def schedulefm(request):
 print("*******")
 T=[]
 #conn = MySQLdb.connect(user='root', db='ASE3',  passwd='siyaram97', host='localhost')
 crsr = connection.cursor()
 if request.method == 'POST':
  if request.POST.get('txtDate') and request.POST.get('purpose') and request.POST.get('type') and request.POST.get('priority'):
     pr=int(request.POST.get('priority'));
     print("////////")
     rd=request.POST.get('txtDate')
     print(rd)	
     year,month,day = (int(x) for x in rd.split('-'))  
     ans = datetime.date(year, month, day)
     rd=str(year)+'-'+str(month)+'-'+str(day);
     a= ans.strftime("%A")
     print(a)
     crsr.execute("select count(*) from timetable_faculty_meetings")
     temp555=crsr.fetchall()
     t3=temp555[0][0]
     crsr.execute("select date from timetable_faculty_meetings")
     temp456=crsr.fetchall()
     #print(temp456[1][0])
     for i in range(0,t3):
      T.append(str(temp456[i][0]))
     #print(T[0])
     if str(rd) not in T:
      print("%%%%%%%%%%%%%%%%%")
      #print(T[0])
      if a!="Sunday":
       crsr.execute("select * from (select day,fid_id,slot_no_id from timetable_faculty_course  join timetable_timetable  on timetable_timetable.c_name_id=timetable_faculty_course.c_name_id) as s1 where s1.day='%s';" %(a))
       ans4= crsr.fetchall()
       for t in ans4:
        print(t)
       C=[]
       for i in range(1,12):
        if i!=3 and i!=6:
         crsr.execute("select count(fid_id) from (select * from (select day,fid_id,slot_no_id from timetable_faculty_course  join timetable_timetable on timetable_timetable.c_name_id=timetable_faculty_course.c_name_id) as q1 where q1.day='%s') as q2 where q2.slot_no_id='%d' ;" %(a,i))
         ans4=crsr.fetchall()
         C.append(ans4[0][0])
         crsr.execute("select count(*) from timetable_faculty;")
         ans5= crsr.fetchall()
       for k in range(0,len(C)):
         C[k]=ans5[0][0]-C[k]
       print(C)
       th=4;
       purpose=request.POST.get("purpose")
       type1=request.POST.get("type");
       if max(C)>=th:
        k5=C.index(max(C))+1
        results=slot_timings.time1(k5)
        #crsr.execute("select start_time,end_time from timetable_slot_timings where slot_no='%d';" %(k5));
        #ans8= crsr.fetchall()
        #a1=ans8[0][0];
        #a2=ans8[0][1];
        #print(results[0])
   
        for m in results:
          a1=m[0]
          a2=m[1]
          print("m",m)
          print("1",m[0])
          print("2",m[1])
        #a1=str(results[0]);
       # print(a1)
        #a2=str(results[1]);
        print(k5)
       else:
        if type1=="Compulsory":
         k5=12;
         a1='18:30:00'
         a2='19:30:00'
         print("The slot to be alloted is 6:30")
        else:
         k5=C.index(max(C)+1)
        # crsr.execute("select start_time,end_time from timetable_slot_timings where slot_no='%d';" %(k5));
         #ans8= crsr.fetchall()
         #a1=ans8[0][0];
         #a2=ans8[0][1];
         for m in results:
          a1=m[0]
          a2=m[1]
       crsr.execute("select count(*) from timetable_faculty_meetings;")
       temp=crsr.fetchall()
       t1=(temp[0][0])+1
       crsr.execute("INSERT INTO timetable_faculty_meetings VALUES('%d','%s','%d','%s','%s','%s','%d');" %(t1,rd,k5,a1,a2,purpose,pr))
       #crsr.execute("select c_name_id from timetable_faculty_course where fid_id='%d';" %(ap))
       #ans888=crsr.fetchall()
       message="The Faculty Meeting scheduled successfully."
       sr={'a3':a1,'a4':a2,'a5':purpose,'msg':message,'date':rd}
       #crsr.execute("select c_name_id from timetable_faculty_course where fid_id=request.user.faculty.fid")
       #ans888=crsr.fetchall()
      else:
        purpose=request.POST.get("purpose")
        crsr.execute("select count(*) from timetable_faculty_meetings;")
        temp=crsr.fetchall()
        t1=(temp[0][0])+1
        a1='10:30:00'
        a2='11:30:00'
        crsr.execute("INSERT INTO timetable_faculty_meetings VALUES('%d','%s','%d','%s','%s','%s','%d');" %(t1,rd,2,a1,a2,purpose,pr))
        message="The Faculty Meeting scheduled successfully."
      sr={'a3':a1,'a4':a2,'a5':purpose,'msg':message,'date':rd,'pr1':pr}
     else:
      crsr.execute("select priority from timetable_faculty_meetings where date='%s';"%(str(rd)))
      pt=crsr.fetchall()
      if pt[0][0]<pr:
       message="There is already a meeting scheduled for this date. Try out for another date!!!"
       sr={'msg':message}
      else:
       crsr.execute("select start_time,end_time,slot_no from timetable_faculty_meetings where date='%s';" %(str(rd)))
       tkkk=crsr.fetchall()
       a1=tkkk[0][0]
       a2=tkkk[0][1]
       k9=tkkk[0][2]
       purpose=request.POST.get("purpose")
       crsr.execute("select count(*) from timetable_faculty_meetings;")
       temp=crsr.fetchall()
       t1=(temp[0][0])+1
       crsr.execute("INSERT INTO timetable_faculty_meetings VALUES('%d','%s','%d','%s','%s','%s','%d');" %(t1,rd,k9,a1,a2,purpose,pr))
       crsr.execute("delete from timetable_faculty_meetings where date='%s' and priority='%d';" %(str(rd),pt[0][0]))
       message="The Faculty Meeting scheduled successfully."
       sr={'a3':a1,'a4':a2,'a5':purpose,'msg':message,'date':rd,'pr1':pr}
     return render(request,'timetable/b.html',sr)
 else:
     return render(request,'timetable/schedulefm.html')
 connection.commit()

def Events(request):
 return render(request,'a13/Events.html')
def secheduled(request):
 return render(request,'a13/secheduled.html')
def scheduleEvents(request):
 L=Courses(request)
 crsr = connection.cursor()
 if request.method == 'POST':
  if request.POST.get('txtDate') and request.POST.get('eventname') and request.POST.get('eventtype'):
   ad=request.POST.get('txtDate')
   etype=request.POST.get('eventtype')
   ename=request.POST.get('eventname')
   list1=[]
   list2=[]
   crsr.execute("select * from timetable_almanac;")
   ans= crsr.fetchall()
   print(ans)
   crsr.execute("select * from timetable_event;")
   ans1= crsr.fetchall()
   crsr.execute("select * from timetable_almanac where date='%s';" %(ad))
   ans2= crsr.fetchall()
   crsr.execute("select date from timetable_almanac where event_type='H';")
   ans5=crsr.fetchall()
#now = datetime.datetime.now()
   today2 = datetime.date.today()
   today1=str(today2)
#year=now.year
   flag=0
   flag1=0
   count=0
   print(ad)
   print(ans1)
   for i in ans1:
    print(i[1])
    if(str(ad)==str(i[1])):
     flag=1
     print("An event is already scheduled on this date.Please select another one")
     break
    else:
     flag=0
   if(flag==0):
    d=datetime.datetime.strptime(ad,'%Y-%m-%d')
    c=str(d)
    s=c.split(" ")
    list1.append(s[0])
    for j in range(1,7):
     if(d+timedelta(days=j)):
      a=str(d+timedelta(days=j))
      b=a.split(" ")
      list1.append(b[0])
    for j in ans:
     for i in list1:
      if(j[1]==i and j[3]=='E'):
       print("Exams in a week! please give another date")
       flag1=1
       break
      break
    if(flag1==0):
     if(etype=='COMPULSORY'):
      for j in ans2:
       if(j[3]=='H'):
        crsr.execute("INSERT INTO timetable_event (date,day,event_type,name) values('%s','%s','%s','%s');"%(ad,j[1],etype,ename))
        connection.commit()
        #print("The event '%s' is scheduled to '%s'",%(ename,ad))
       else:
        crsr.execute("select timetable_almanac.date from timetable_almanac inner join timetable_event on timetable_almanac.date=timetable_event.date;")
        ans4=crsr.fetchall()
        s=[]
        for t in ans4:
         s.append(str(t[0]))
        s1=[]
        for tr in ans5:
         s1.append(tr[0])
        for i in s:
         if i in s1:
          s1.remove(i)
         #print("s1:",s1)
       bc=str(s1[0])
       year,month,day= (int(x) for x in bc.split('-'))
       ans8=datetime.date(year,month,day)
       f=ans8.strftime("%A")
       #print(f)
       crsr.execute("INSERT INTO timetable_event (date,day,event_type,name) values('%s','%s','%s','%s');"%(s1[0],f,etype,ename))
       connection.commit()
       #print("The event '%s' is scheduled to '%s'",%(ename,s1[0]))
     elif(etype=='OPTIONAL'):
      year,month,day= (int(x) for x in ad.split('-'))
      ans8=datetime.date(year,month,day)
      f=ans8.strftime("%A")
      crsr.execute("INSERT INTO timetable_event (date,day,event_type,name) values('%s','%s','%s','%s');"%(ad,f,etype,ename))
      connection.commit()
      #print("The event '%s' is scheduled to '%s');"%(ename,ad)
      #print("Updated")
   crsr.execute("select * from timetable_event ;")
   ans=crsr.fetchall()
   context={'s': ans}
   return render(request,'timetable/scheduleEvents.html',context)
 else:
  return render(request,'timetable/scheduleE.html',{'coursesname':L})
def RescheduleC(request):
 crsr = connection.cursor()
 A= DP(request)
 if request.method == 'POST':
  if request.POST.get('from_date') and request.POST.get('to_date') and request.POST.get('c'):
   ad=request.POST.get('from_date')
   rd=request.POST.get('to_date')
   c1=request.POST.get('c')
   print(rd)
   print(rd.split('/'))
   month,day,year = (int(x) for x in rd.split('/'))
   print(month)
   print(day)
   print(year)  
   rd=str(year)+'-'+str(month)+'-'+str(day);
   month1,day1,year1 = (int(x) for x in ad.split('/'))
   ad=str(year1)+'-'+str(month1)+'-'+str(day1); 
   ans = datetime.date(year, month, day)
   a= ans.strftime("%A")
   print(a)
   crsr.execute("select timetable_course.c_name,timetable_course.cid,timetable_timetable.slot_no_id,timetable_timetable.day from timetable_timetable join timetable_course on timetable_timetable.c_name_id=timetable_course.c_name where timetable_timetable.day='%s';" %(a))
   ans2= crsr.fetchall()
   crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(c1))
   ans5= crsr.fetchall()
   b=ans5[0][0]
   print(b)
   B=[]
   B1=[]
   crsr.execute("select count(distinct(substr(student_id_id,2,4))) from timetable_student_course where c_name_id='%s';" %(c1))
   ans221 = crsr.fetchall()
   crsr.execute("select distinct(substr(timetable_student_course.student_id_id,1,4)) from timetable_student_course where c_name_id='%s';" %(c1))
   ans222=crsr.fetchall()
   #print(ans221[0][0])
   #print(ans222[1][0])
   for i in range(0,ans221[0][0]):
    B.append(int(ans222[i][0])) 
   print(":::::::::::::::")
   print(B)
   for i in range (0,len(B)):
    B[i]=year-B[i]
   print(B)
   for i in B:
    crsr.execute("select slot_no from timetable_break where batch_no='%d';" %(i))
    ans44=crsr.fetchall()
    B1.append(ans44[0][0])
   print(B1)
   A=[]
   for i in range(1,11):
    if i!=3 and i!=6:
     C=[]
     C2=[]
     print("*********")
     print(a)
     crsr.execute("select count(*) from (select * from(select * from timetable_timetable join timetable_course on timetable_timetable.c_name_id=timetable_course.c_name) as w1 where w1.day='%s') as w2 where w2.slot_no_id='%d';" %(a,i))
     ans7= crsr.fetchall()
     if ans7[0][0]==0:
      if i not in B1:
       i1=i;
       A.append(i1)
     else:
      crsr.execute("select slot_no_id,day,c_name from (select slot_no_id,day,c_name from(select c_name,timetable_course.cid,slot_no_id,day from timetable_timetable join timetable_course on timetable_timetable.c_name_id=timetable_course.c_name) as x1 where x1.day='%s') as x2 where x2.slot_no_id='%d';" %(a,i))
      ans2= crsr.fetchall()
      #for k1 in ans2:
      # print(k1)
      for j in ans2:
       #print("$$$$$$$$")
       #print(c2)
       c2=j[2]
       crsr.execute("SELECT count(*) FROM (select student_id_id from timetable_student_course where c_name_id = '%s') as t1 where student_id_id in (select student_id_id from (select student_id_id from timetable_student_course where c_name_id= '%s') as t2);" %(c1,c2))
       ans3= crsr.fetchall()
       #print(ans3[0][0])
       C.append(ans3[0][0])
       crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(c2))
       ans6= crsr.fetchall()
       b1=ans6[0][0]
       C2.append(b1)
       print(C2)
      if max(C)==0:
       if b not in C2:
        if i not in B1:
         i1=i;
         #break;
         A.append(i1);
   print("%%%%%%%%%%%")
   print(A)
   if(len(A)==0):
     s="Cannot be rescheduled on this date!!! Try another"
     context={'st':s}
     return render(request,'timetable/RC.html',context)
   else:
    #print(i1)
    crsr.execute("select count(*) from timetable_schedule_history where resc_date='%s';" %(rd))
    ans33=crsr.fetchall()
    A1=[]
    if ans33[0][0]==0:
     A1=A
    else:
     for i in A:
      C=[]
      C2=[]
      crsr.execute("select count(*) from (select slot_no_id,day,c_name,resc_date from(select timetable_course.c_name,timetable_course.cid,slot_no_id,day,timetable_schedule_history.resc_date from timetable_schedule_history join timetable_course on timetable_schedule_history.c_name=timetable_course.c_name) as q4 where resc_date='%s') as q5 where slot_no_id='%d';" %(rd,i))
      ans7= crsr.fetchall()
      if ans7[0][0]==0:
       i1=i;
       A1.append(i1)
      else:
       print(i1)
       crsr.execute("select * from (select slot_no_id,day,c_name,resc_date from(select timetable_course.c_name,cid,slot_no_id,day,timetable_schedule_history.resc_date from timetable_schedule_history join timetable_course on timetable_schedule_history.c_name=timetable_course.c_name) as w3 where resc_date='%s') as w4 where slot_no_id='%d';" %(rd,i))
       ans2= crsr.fetchall()
       for j in ans2:
        c2=j[2]
        crsr.execute("SELECT count(*) FROM (select student_id_id from timetable_student_course where c_name_id = '%s') as r1 where student_id_id in (select student_id_id from (select student_id_id from timetable_student_course where c_name_id= '%s') as r2);" %(c1,c2))
        ans3= crsr.fetchall()
        #print(ans3[0][0])
        C.append(ans3[0][0])
        crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(c2))
        ans6= crsr.fetchall()
        print("****");
        print(ans6)
        b1=ans6[0][0]
        C2.append(b1)
        print(C2)
        if max(C)==0:
         if b not in C2:
          i1=i;
          A1.append(i1)
    #print(A1)
    if len(A1)==0:
     s="Cannot be rescheduled on this date!!! Try another"
     context={'st':s}
     return render(request,'timetable/RC.html',context)
    else:
     crsr.execute("select count(*) from timetable_schedule_history ;" )
     temp8=crsr.fetchall()
     temp9=temp8[0][0]+1
     s1=A1[0]
     A2=[]
     crsr.execute("select * from timetable_room where day='%s' and slot_no='%d';" %(a,s1))
     ans8= crsr.fetchall()
     #print(d1)
     crsr.execute("select rid from timetable_schedule_history where resc_date='%s' and slot_no_id='%d';" %(rd,s1))
     ans9= crsr.fetchall()
     V=[]
     for ik in ans9:
      V.append(ik[0]);
     print(a)
     for k5 in ans8:
      if k5[4]==0:
       if k5 not in V:
        #print("%%")
        d=k5[1]
        A2.append(d)
     d=A2[0]
     crsr.execute("INSERT INTO timetable_schedule_history VALUES('%d','%s', '%s', '%s', '%s', '%d','%d');" %(temp9,ad,rd,a,c1,d,s1))
     connection.commit()
     s="Can be rescheduled"
     crsr.execute("select start_time,end_time from timetable_slot_timings where slot_no='%d';" %(s1))
     temp38=crsr.fetchall()
     st_1=temp38[0][0]
     et_1=temp38[0][1]
     c5={'sl1':s1,'c2':c1, 'rd1':rd,'sq':A,'st':s,"room":d,'start':st_1,'end':et_1}
    
     return render(request,'timetable/RC.html',c5)
 else:
  return render(request,'timetable/RescheduleC.html',{'course':A})
def Viewfm(request):
 crsr = connection.cursor()
 crsr.execute("SELECT id,date,slot_no,start_time,end_time,purpose from timetable_faculty_meetings;")
 ans=crsr.fetchall()
 context={'a':ans}
 return render(request,'timetable/Viewfm.html',context)
 
def facultyindex(request):
 return render(request,'timetable/facultyindex.html')

def student_list(request):
	if request.method == 'POST':
		if request.POST.get('projecttype'):
			cursor=connection.cursor()
			Facultyid=request.user.faculty.fid
			print(Facultyid)
			protype=request.POST.get('projecttype')
			#print(protype)
			cursor.execute("SELECT student_id_id FROM timetable_faculty_students where fid_id='%d' and project_type='%d';"%(int(Facultyid),int(protype)))
			s5=cursor.fetchall()
			#cursor.execute("SELECT first_name,last_name FROM timetable_user where id")
			wu=[]
			for i in s5:
				cursor.execute("SELECT user_id,student_id FROM timetable_student where student_id='%s';"%(i[0]))
				s7=cursor.fetchall()
				wu.append(s7)
			print(wu)
			s=[]
			for k in wu:
				for t in k:
					io=[]
					cursor.execute("SELECT first_name,last_name FROM timetable_user where id='%d'"%(t[0]))
					s8=cursor.fetchall()
					io.append(t[1])
					io.append(s8[0][0])
					io.append(s8[0][1])
					s.append(io)
			print("s",s)
#print("printing days from timetable table",L)
#print(" Given a particular date,all the courses with their respective slots on that particular day will be displayed")
			
			connection.commit()
			connection.close()
			context={'students':s}
			return render(request,'timetable/sfs.html',context)
	else:
			return render(request,'timetable/studentlist_BH.html')
			
			

def allot(C2,i333):
 Csr=[]
 crsr = connection.cursor()
 for k in C2:
  print(k)
  slots=[1,2,4,5,7,8,9,10,11]
  crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(k))
  ans13= crsr.fetchall()
  b=ans13[0][0]
  B=[]
  crsr.execute("select day_1,day_2,day_3 from (select * from timetable_faculty join timetable_faculty_course on timetable_faculty.fid=timetable_faculty_course.fid_id) as t5 where c_name_id='%s';" %(k))
  ans9=crsr.fetchall()
  B.append(ans9[0][0])
  B.append(ans9[0][1])
  B.append(ans9[0][2])
  k1=B[i333];
  print(k1)
  #count=count+1;
  crsr.execute("select slot_no_id,c_name_id from timetable_timetable where day='%s';" %(k1))
  ans10=crsr.fetchall()
  C3=[]
  C5=[]
  for k2 in ans10:
   C3.append(k2[0])
  C4=[]
  C4=list(set(C3));
  #print(C4)
  Cs=[];
  for k3 in C4:
   print(k3)
  #C4=[];
   count=[];
   crsr.execute("select slot_no_id,c_name_id from (select slot_no_id,c_name_id from timetable_timetable where day='%s') as t3 where slot_no_id='%d';" %(k1,k3))
   ans11=crsr.fetchall()
   for k4 in ans11:
    #print("#############")
    co2=k4[1];
    co1=k;
    #print(co2)
    #print(co1)
    crsr.execute("SELECT count(*) FROM (select student_id_id from timetable_student_course where c_name_id = '%s') as t1 where student_id_id in (select student_id_id from (select student_id_id from timetable_student_course where c_name_id= '%s') as t2);" %(co1,co2)) 
    ans12=crsr.fetchall()
    #print(ans12)
    count.append(ans12[0][0])
    crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(co2))
    ans14= crsr.fetchall()
    b2=ans14[0][0]
    C5.append(b2)
   if max(count)==0:
   #print("%%%%%%%%%")
    if b not in C5:
     Cs.append(k3);
  print(C4)
  print(Cs);
  for temp1 in C4:
   if temp1 not in Cs:
    slots.remove(temp1)
  print("ttttttttttttttttttt")
  print(slots)
  if len(slots)==0:
   Csr.append(k)
  else:
   sl=random.choice(slots)
   print(sl)
   room3=[]
   crsr.execute("select rid,availability_status from timetable_room where slot_no='%d' and day='%s';" %(sl,k1))
   ans333=crsr.fetchall()
   print(ans333)
   for t3 in ans333:
    if t3[1]==0:
     room3.append(t3[0])
   r_id=random.choice(room3)
   print(r_id)
   leng=len(k);
   crsr.execute("select count(*) from timetable_timetable");
   ans121=crsr.fetchall()
   a21=ans121[0][0];
   if(k[leng-1]=='A' and k[leng-2]=='_'):
    i9=1;
   elif(k[leng-1]=='B' and k[leng-2]=='_'):
    i9=2;
   else:
    i9=0;
   crsr.execute("insert into timetable_timetable values('%d','%s','%d','%d','%s','%d');" %(a21+1,k1,i9,r_id,k,sl))
   as1=1;
   crsr.execute("update timetable_room set availability_status='%d' where slot_no='%d' and rid='%d' and day='%s';" %(as1,sl,r_id,k1))
   connection.commit()
  print(slots)
 return Csr;












def generate(request):
 crsr = connection.cursor()
 crsr.execute("update timetable_room set availability_status=0 where availability_status=1;")
 crsr.execute("delete from timetable_timetable") 
 crsr.execute("select c_name from timetable_course where no_hours>=5")
 ans1=crsr.fetchall()
 A=[]
 slots=[1,2,4,5,7,8,9,10,11]
 for i in ans1:
  A.append(i[0])
 print(A)
 crsr.execute("select day_1,day_2,day_3 from (select * from timetable_faculty join timetable_faculty_course on timetable_faculty.fid=timetable_faculty_course.fid_id) as t2 where c_name_id='%s';" %(A[0]))
 ans2=crsr.fetchall();
 if A[0]=="decr" or A[0]=="BEC":
  room=223
 else:
  room=221
 crsr.execute("select count(*) from timetable_timetable");
 ans122=crsr.fetchall()
 a22=ans122[0][0];
 crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',8);" %(a22+1,ans2[0][0],room,A[0]))
 crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',9);" %(a22+2,ans2[0][0],room,A[0]))
 crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',10);" %(a22+3,ans2[0][0],room,A[0])) 
 for i in range(1,len(A)):
  print(A[i])
  if A[i]=="decr" or A[i]=="BEC":
   room=223
  else:
   room=221
  B=[]
 
  crsr.execute("select day_1,day_2,day_3 from (select * from timetable_faculty join timetable_faculty_course on timetable_faculty.fid=timetable_faculty_course.fid_id) as t1 where c_name_id='%s';" %(A[i]))
  ans3=crsr.fetchall()
  B.append(ans3[0][0])
  B.append(ans3[0][1])
  B.append(ans3[0][2])
  print(B)
  C=[]
  crsr.execute("select day from timetable_timetable")
  ans4=crsr.fetchall()
  for k in ans4:
   C.append(k[0])
  count=0;  
  for j in B:
   if j not in C:
    count=count+1
    crsr.execute("select count(*) from timetable_timetable");
    ans123=crsr.fetchall()
    a23=ans123[0][0];
    print(a23)
    print(A[i])
    crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',8);" %(a23+1,j,room,A[i]))
    crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',9);" %(a23+2,j,room,A[i]))
    crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',10);" %(a23+3,j,room,A[i]))
    break;
  C1=[]
  crsr.execute("select day from timetable_timetable where slot_no_id=1")
  ans5=crsr.fetchall()
  for k in ans5:
   C1.append(k[0])
  if(count==0):
   for j in B:
    if j not in C1:
     crsr.execute("select count(*) from timetable_timetable");
     ans124=crsr.fetchall()
     a24=ans124[0][0];
     crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',1);" %(a24+1,j,room,A[i]))
     crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',2);" %(a24+2,j,room,A[i]))
     crsr.execute("insert into timetable_timetable values('%d','%s',3,'%d','%s',4);" %(a24+3,j,room,A[i]))
     break;
 connection.commit() 
 crsr.execute("select * from timetable_timetable")
 ans6=crsr.fetchall()
 for i in ans6:
  print(i)
 crsr.execute("select c_name from timetable_course")
 ans7=crsr.fetchall()
 C2=[]
 for i in ans7:
  C2.append(i[0])
 print(C2)
 C=[]
#count=0;
 for k in C2:
  print(k)
  slots=[1,2,4,5,7,8,9,10,11]
  crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(k))
  ans13= crsr.fetchall()
  b=ans13[0][0]
  B=[]
  crsr.execute("select day_1,day_2,day_3 from (select * from timetable_faculty join timetable_faculty_course on timetable_faculty.fid=timetable_faculty_course.fid_id) as t3 where c_name_id='%s';" %(k))
  ans9=crsr.fetchall()
  B.append(ans9[0][0])
  B.append(ans9[0][1])
  B.append(ans9[0][2])
  k1=B[0];
  print(k1)
 #count=count+1;
  crsr.execute("select slot_no_id,c_name_id from timetable_timetable where day='%s';" %(k1))
  ans10=crsr.fetchall()
  C3=[]
  C5=[]
  for k2 in ans10:
   C3.append(k2[0])
  C4=[]
  C4=list(set(C3));
 #print(C4)
  Cs=[];
  for k3 in C4:
   print(k3)
   f=0;
  #C4=[];
   count=[];
   crsr.execute("select slot_no_id,c_name_id from (select slot_no_id,c_name_id from timetable_timetable where day='%s') as t5 where slot_no_id='%d';" %(k1,k3))
   ans11=crsr.fetchall()
   for k4 in ans11:
    #print("#############")
    co2=k4[1];
    co1=k;
    #print(co2)
    #print(co1)
    crsr.execute("SELECT count(*) FROM (select student_id_id from timetable_student_course where c_name_id = '%s') as t1 where student_id_id in (select student_id_id from (select student_id_id from timetable_student_course where c_name_id= '%s') as t2);" %(co1,co2)) 
    ans12=crsr.fetchall()
    #print(ans12)
    count.append(ans12[0][0])
    crsr.execute("select fid_id from timetable_faculty_course where c_name_id='%s';" %(co2))
    ans14= crsr.fetchall()
    b2=ans14[0][0]
    C5.append(b2)
   if max(count)==0:
    print("%%%%%%%%%")
    if b not in C5:
     print("---------------------")
     Cs.append(k3);
  print(C4)
  print(Cs);
  for temp1 in C4:
    if temp1 not in Cs:
     slots.remove(temp1)
  sl=random.choice(slots)
  print(slots);
  print(sl)
  room3=[]
  crsr.execute("select rid,availability_status from timetable_room where slot_no='%d' and day='%s';" %(sl,k1))
  ans333=crsr.fetchall()
  print("*************************")
  print(ans333)
  print(k1)
  print(k)
  for t3 in ans333:
   if t3[1]==0:
    room3.append(t3[0])
  r_id=random.choice(room3)
  leng=len(k);
  crsr.execute("select count(*) from timetable_timetable");
  ans125=crsr.fetchall()
  a25=ans125[0][0];
  if(k[leng-1]=='A' and k[leng-2]=='_'):
   i9=1;
  elif(k[leng-1]=='B' and k[leng-2]=='_'):
   i9=2;
  else:
   i9=0;
  crsr.execute("insert into timetable_timetable values('%d','%s','%d','%d','%s','%d');" %(a25+1,k1,i9,r_id,k,sl))
  as1=1;
  crsr.execute("update timetable_room set availability_status='%d' where slot_no='%d' and rid='%d' and day='%s';" %(as1,sl,r_id,k1))
  connection.commit()
  print(slots) 
 crsr.execute("select * from timetable_timetable")
 ans6=crsr.fetchall()
 for i in ans6:
  print(i)  
 #print(count)
 Csr1=[]
 Csr1=allot(C2,1);
 print(Csr1)
 Csr2=[]
 Csr2=allot(C2,2);
 print(Csr2)

 if len(Csr1)!=0:
  Csr3=[]
  Csr3=allot(Csr1,2)
  if len(Csr3)!=0:
   Csr4=[]
   Csr3=allot(Csr1,0)
 if len(Csr2)!=0:
  Csr3=[]
  Csr3=allot(Csr2,0)
  if len(Csr3)!=0:
   Csr4=[]
   Csr3=allot(Csr2,1)

  
 crsr.execute("select * from timetable_timetable;")
 ans6=crsr.fetchall()
 c=0;
 for i in ans6:
  c=c+1
  print(i)
 print(c) 
 h1=[]
 Ct=[]
 for k in C2:
  print("&&&&&&&&&&&&&&&");
  crsr.execute("select count(*) from timetable_timetable where c_name_id='%s';" %(k))
  ans565=crsr.fetchall()
  crsr.execute("select no_hours from timetable_course where c_name='%s';" %(k))
  ans566=crsr.fetchall()
  h1.append(ans566[0][0]-ans565[0][0])
 for i8 in range(0,len(h1)):
  if h1[i8]!=0:
   Ct.append(C2[i8]);
 print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
 print(h1)
 print(Ct)
 print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
 s1=[]
 s1=allot(Ct,0);
 
 h1=[]
 Ct=[]
 for k in C2:
  print("&&&&&&&&&&&&&&&");
  crsr.execute("select count(*) from timetable_timetable where c_name_id='%s';" %(k))
  ans565=crsr.fetchall()
  crsr.execute("select no_hours from timetable_course where c_name='%s';" %(k))
  ans566=crsr.fetchall()
  h1.append(ans566[0][0]-ans565[0][0])
 for i8 in range(0,len(h1)):
  if h1[i8]!=0:
   Ct.append(C2[i8]);
 print("==============================================");
 print(h1)
 print(Ct)
 print("=============================================");
 s1=[]
 if(len(Ct)>0):
  s1=allot(Ct,1);
 h1=[]
 Ct=[]
 for k in C2:
  print("&&&&&&&&&&&&&&&");
  crsr.execute("select count(*) from timetable_timetable where c_name_id='%s';" %(k))
  ans565=crsr.fetchall()
  crsr.execute("select no_hours from timetable_course where c_name='%s';" %(k))
  ans566=crsr.fetchall()
  h1.append(ans566[0][0]-ans565[0][0])
 for i8 in range(0,len(h1)):
  if h1[i8]!=0:
   Ct.append(C2[i8]);
 print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
 print(h1)
 print(Ct)
 print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
 s1=[]
 if(len(Ct)>0):
  s1=allot(Ct,2);
 print("*************************\n");
 crsr.execute("select * from timetable_timetable order by day")
 ans6=crsr.fetchall()
 c=0;
 for i in ans6:
  c=c+1
  print(i)
 print(c) 
 crsr.execute("SELECT * FROM timetable_timetable ORDER BY CASE WHEN Day = 'Monday' THEN 1 WHEN Day = 'Tuesday' THEN 2 WHEN Day = 'Wednesday' THEN 3 WHEN Day = 'Thursday' THEN 4 WHEN Day = 'Friday' THEN 5 WHEN Day = 'Saturday' THEN 6 END ASC, slot_no_id ASC")
 ans7=crsr.fetchall()
 c=0;
 for i in ans7:
  c=c+1
  print(i)
 print(c)
 return render(request,'timetable/generate.html') 
#for o3 in range(0,len(c1)):
#Ct[0]=c2[0]-c1[0]
        
      
    
  
  #added--------------------------------------------------------------------------------------------
@api_view(['GET'])
def get_timetable(request):
  rest_list=timetable.objects.all()
  serializer = timetableSerializer(rest_list, many=True)
  return Response(serializer.data)
#--------------------------------------------------------------------------------------------------


   
  
  
 
     
