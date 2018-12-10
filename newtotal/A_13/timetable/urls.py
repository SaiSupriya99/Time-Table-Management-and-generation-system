from .views import *
from django.urls import path,re_path
from . import views
urlpatterns = [
	path('', index,name="index"),
	path('home',home,name="home"),
	re_path('home/index2/(?P<token_id>[\w\!-@+]+)/',student_login,name="student_login"),
	path('authority_login',authority_login,name="authority_login"),
	path('register',register,name="register"),
	path('logout',logout_user,name="logout"),
	path('searchevent',SearchEvent,name="eventsearch"),
	path('freeslots_faculty',Faculty_freeslots,name="freeslots_faculty"),
	path('ExamG',examT,name="ExamG"),
	path('TimetableG',timetableg,name="timetableg"),
	path('ViewExam',view_examtimetable,name="viewExam"),
	path('timetableview',timetableview,name="viewtimetable"),
	path('tacriteria',tacriteria,name="tacriteria"),
	path('allocationta',taalloc, name="ta_alloc"),
	path('coursetaview',faculty_taview,name="talist"),
	path('freeslots_student',student_freeslots,name="student"),
	path('RescheduleC',views.RescheduleC, name="reschedule"),
    path('RC',views.RC),
    path('generate',views.generate,name="timetableg"),
    path('DP',views.DP),
    path('facultyindex',views.facultyindex,name="fi"),
    path('b',views.b),
    path('Events',views.Events),
    path('Viewfm',views.Viewfm,name="viewfm"),
    path('schedulefm',views.schedulefm, name="schedule"),
    path('scheduleEvents',views.scheduleEvents,name="scheduleEvents"),
    path('scheduleE',views.scheduleE),
    path('secheduled',views.secheduled),
    path('liststudent',student_list,name="sfs"),
    path('StudentTa',student_taview,name="studenttalist"),
    path('ClassTimetable',view_classtimetable,name="classtable"),

#added--------------------------------------------------------------------------------------------
    path('timetableNew/',views.get_timetable,name="get_timetable"),
    #--------------------------------------------------------------------------------------------------

]
