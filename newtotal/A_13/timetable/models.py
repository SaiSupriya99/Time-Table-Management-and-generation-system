from datetime import date
from django.db import models
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import PermissionsMixin
from django.utils.translation import gettext as _
from django.db import connection
class UserManager(BaseUserManager):
    use_in_migrations = True
    def _create_user(self, email, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('The Email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self._create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_('email address'), unique=True)
    first_name = models.CharField(_('first name'), max_length=30, blank=True)
    last_name = models.CharField(_('last name'), max_length=30, blank=True)
    token = models.CharField(_('token'), max_length=1000, blank=True)
    USER_TYPE_CHOICES = (
      (1, 'Student'),
      (2, 'Faculty'),
      (3, 'Admin'),
    )
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES,default=1)
    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_('Designates whether the user can log into this site.'),
    )
    is_active = models.BooleanField(
        _('active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
    )
    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

    def get_full_name(self):
        '''
        Returns the first_name plus the last_name, with a space in between.
        '''
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        '''
        Returns the short name for the user.
        '''
        return self.first_name

    def email_user(self, subject, message, from_email=None, **kwargs):
        '''
        Sends an email to this User.
        '''


class timetable(models.Model):
    slot_no = models.ForeignKey('slot_timings',on_delete=models.CASCADE)
    day = models.CharField(max_length=50)
    c_name = models.ForeignKey('course',on_delete=models.CASCADE)
    class_type = models.IntegerField(null = True)
    rid = models.IntegerField()
    class Meta:
        unique_together=("slot_no","day","c_name","rid")

class schedule_history(models.Model):
    present_date = models.DateField()
    resc_date = models.DateField()
    slot_no = models.ForeignKey('slot_timings',on_delete=models.CASCADE)
    day=models.CharField(max_length=250)
    c_name=models.CharField(max_length=250)
    rid=models.IntegerField()


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, unique=True)
    student_id= models.CharField(primary_key=True,max_length=250)
    cgpa=models.FloatField(null=True,blank=True,default=None)

class room(models.Model):
    rid=models.IntegerField()
    day= models.CharField(max_length=250)
    slot_no = models.IntegerField(default=1)
    availability_status=models.IntegerField(default=0)
    capacity=models.CharField(max_length=250)
    class Meta:
      unique_together=("rid","day","slot_no")


class slot_timings(models.Model):
    slot_no=models.IntegerField(primary_key= True)
    start_time= models.TimeField()
    end_time= models.TimeField()

    @staticmethod
    def time1(slot):
     crsr=connection.cursor()
     crsr.callproc('test',[slot,])
     results=crsr.fetchall()
     l=[]
     for i in results:
        l.append(list(i))
     crsr.close()
    
     return l


class Break(models.Model):
    batch_no=models.IntegerField(primary_key=True)
    slot_no=models.IntegerField()


class faculty(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, unique=True)
    fid=models.AutoField(primary_key=True)
    day_1=models.CharField(max_length=30,null=True)
    day_2=models.CharField(max_length=30,null=True)
    day_3=models.CharField(max_length=30,null=True)


class Faculty_Meetings(models.Model):
    date=models.DateField()
    slot_no = models.IntegerField(default=1)
    start_time= models.TimeField()
    end_time= models.TimeField()
    purpose=models.CharField(max_length=250)
    priority=models.IntegerField(default=0)

class course(models.Model):
    cid= models.IntegerField(unique=True)
    c_name=models.CharField(primary_key=True,max_length=250)
    no_credits=models.IntegerField()
    no_hours=models.IntegerField()


class faculty_course(models.Model):
    c_name=models.ForeignKey('course',on_delete=models.CASCADE)
    fid=models.ForeignKey('faculty',on_delete=models.CASCADE)


class faculty_students(models.Model):
    fid=models.ForeignKey('faculty',on_delete=models.CASCADE)
    student_id=models.ForeignKey('Student',on_delete=models.CASCADE)
    Project_CHOICES = (
      (1, 'BTP'),
      (2, 'Honours'),
    )
    project_type=models.PositiveSmallIntegerField(choices=Project_CHOICES,default=1)


class criteria_ta(models.Model):
    c_name = models.ForeignKey('course',on_delete=models.CASCADE)
    Criteria=models.FloatField(null=True,blank=True,default=None)
    Grade=models.IntegerField(default=None)
    Count=models.IntegerField(default=None)


class ta_alloc(models.Model):
    c_name = models.ForeignKey('course',on_delete=models.CASCADE)
    student_id= models.ForeignKey('Student',on_delete=models.CASCADE)
# can give option of semester and year(like monsoon 2018)


class student_course(models.Model):
    student_id = models.ForeignKey('Student',on_delete=models.CASCADE)
    c_name = models.ForeignKey('course',on_delete=models.CASCADE)
# someone can fail and repeat the course

    
class student_grade(models.Model):
    student_id = models.ForeignKey('Student',on_delete=models.CASCADE)
    c_name = models.ForeignKey('course',on_delete=models.CASCADE)
    grade =  models.IntegerField()


class almanac(models.Model):
    date=models.DateField(default=date.today)
    day=models.CharField(max_length=250)
    event_type=models.CharField(max_length=250)
    name=models.CharField(max_length=250)


class event(models.Model):
    date=models.DateField(default=date.today)
    day=models.CharField(max_length=250)
    event_type=models.CharField(max_length=250)
    name=models.CharField(max_length=250)


class exam(models.Model):
    date=models.DateField()
    slot_no=models.IntegerField(default=None)
    exam_type=models.CharField(max_length=250)
    c_name=models.ForeignKey('course',on_delete=models.CASCADE)


class exam_slot(models.Model):
    exam_type=models.CharField(max_length=250)
    start_time=models.TimeField()
    end_time=models.TimeField()
    slot_no=models.IntegerField(default=None)
