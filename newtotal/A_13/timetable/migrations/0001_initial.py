# Generated by Django 2.1.2 on 2018-11-16 20:33

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import timetable.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0009_alter_user_last_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('token', models.CharField(blank=True, max_length=1000, verbose_name='token')),
                ('user_type', models.PositiveSmallIntegerField(choices=[(1, 'Student'), (2, 'Faculty'), (3, 'Admin')], default=1)),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
            },
            managers=[
                ('objects', timetable.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='almanac',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=datetime.date.today)),
                ('day', models.CharField(max_length=250)),
                ('event_type', models.CharField(max_length=250)),
                ('name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='Break',
            fields=[
                ('batch_no', models.IntegerField(primary_key=True, serialize=False)),
                ('slot_no', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='course',
            fields=[
                ('cid', models.IntegerField(unique=True)),
                ('c_name', models.CharField(max_length=250, primary_key=True, serialize=False)),
                ('no_credits', models.IntegerField()),
                ('no_hours', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='criteria_ta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Criteria', models.FloatField(blank=True, default=None, null=True)),
                ('Grade', models.IntegerField(default=None)),
                ('Count', models.IntegerField(default=None)),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
            ],
        ),
        migrations.CreateModel(
            name='event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=datetime.date.today)),
                ('day', models.CharField(max_length=250)),
                ('event_type', models.CharField(max_length=250)),
                ('name', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='exam',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('slot_no', models.IntegerField(default=None)),
                ('exam_type', models.CharField(max_length=250)),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
            ],
        ),
        migrations.CreateModel(
            name='exam_slot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exam_type', models.CharField(max_length=250)),
                ('start_time', models.TimeField()),
                ('end_time', models.TimeField()),
                ('slot_no', models.IntegerField(default=None)),
            ],
        ),
        migrations.CreateModel(
            name='faculty',
            fields=[
                ('fid', models.AutoField(primary_key=True, serialize=False)),
                ('day_1', models.CharField(max_length=30, null=True)),
                ('day_2', models.CharField(max_length=30, null=True)),
                ('day_3', models.CharField(max_length=30, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='faculty_course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
                ('fid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.faculty')),
            ],
        ),
        migrations.CreateModel(
            name='Faculty_Meetings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('slot_no', models.IntegerField(default=1)),
                ('start_time', models.TimeField()),
                ('end_time', models.TimeField()),
                ('purpose', models.CharField(max_length=250)),
                ('priority', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='faculty_students',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_type', models.PositiveSmallIntegerField(choices=[(1, 'BTP'), (2, 'Honours')], default=1)),
                ('fid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.faculty')),
            ],
        ),
        migrations.CreateModel(
            name='room',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rid', models.IntegerField()),
                ('day', models.CharField(max_length=250)),
                ('slot_no', models.IntegerField(default=1)),
                ('availability_status', models.IntegerField(default=0)),
                ('capacity', models.CharField(max_length=250)),
            ],
        ),
        migrations.CreateModel(
            name='schedule_history',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('present_date', models.DateField()),
                ('resc_date', models.DateField()),
                ('day', models.CharField(max_length=250)),
                ('c_name', models.CharField(max_length=250)),
                ('rid', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='slot_timings',
            fields=[
                ('slot_no', models.IntegerField(primary_key=True, serialize=False)),
                ('start_time', models.TimeField()),
                ('end_time', models.TimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('student_id', models.CharField(max_length=250, primary_key=True, serialize=False)),
                ('cgpa', models.FloatField(blank=True, default=None, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='student_course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.Student')),
            ],
        ),
        migrations.CreateModel(
            name='student_grade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('grade', models.IntegerField()),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.Student')),
            ],
        ),
        migrations.CreateModel(
            name='ta_alloc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.Student')),
            ],
        ),
        migrations.CreateModel(
            name='timetable',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('day', models.CharField(max_length=50)),
                ('class_type', models.IntegerField(null=True)),
                ('rid', models.IntegerField()),
                ('c_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.course')),
                ('slot_no', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.slot_timings')),
            ],
        ),
        migrations.AddField(
            model_name='schedule_history',
            name='slot_no',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.slot_timings'),
        ),
        migrations.AlterUniqueTogether(
            name='room',
            unique_together={('rid', 'day', 'slot_no')},
        ),
        migrations.AddField(
            model_name='faculty_students',
            name='student_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='timetable.Student'),
        ),
        migrations.AlterUniqueTogether(
            name='timetable',
            unique_together={('slot_no', 'day', 'c_name', 'rid')},
        ),
    ]