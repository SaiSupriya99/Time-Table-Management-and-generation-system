from . import models
from rest_framework import serializers

class timetableSerializer(serializers.ModelSerializer):
	class Meta:
		model=models.timetable
		fields=('slot_no','day','c_name','class_type','rid',)
			
