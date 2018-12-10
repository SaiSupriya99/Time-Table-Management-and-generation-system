from django.contrib import admin
from .models import *

admin.site.register([User,timetable,schedule_history,Student,room,faculty,slot_timings,Break,Faculty_Meetings,course,faculty_course])
admin.site.register([faculty_students,criteria_ta,ta_alloc,student_course,student_grade,almanac,event,exam,exam_slot])
