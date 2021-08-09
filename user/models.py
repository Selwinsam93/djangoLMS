from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django_countries.fields import CountryField
from course.models import CourseId, Category
from django.utils.translation import ugettext as _
from django.utils import timezone
# Create your models here.




gender=(
('Male','Male'),
('Female','Female'),
('Others','Others')
)
edu=(
("doctorate","Doctorate"),
("master","Master's or professional degree" ),
("bachelor","Bachelor's degree"),
("assosiate","Assosiate degree"),
("noformal","No formal education"),
("other","Other education")
)


class Profile(models.Model):
    user = models.OneToOneField(User,related_name='profile', on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=40,null=True, blank=True)
    country = CountryField(null=True, blank=True)
    gender=models.CharField(max_length=40,choices=gender, null=True, blank=True)
    education=models.CharField(max_length=40,choices=edu, null=True, blank=True)
    about=models.CharField(max_length=1200, null=True, blank=True)

    def __str__(self):
          return self.user.username


@receiver(post_save, sender=User)
def update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


class Enrollment(models.Model):
    enrolled_date=models.DateTimeField(null=True, blank=True,verbose_name=("Enrolled Date"))
    course_name=models.CharField(verbose_name=_("Course Name"),null=True, blank=True,max_length=250)
    category=models.ForeignKey(Category,null=True,blank=True,max_length=250,verbose_name=_("Category"),on_delete=models.CASCADE)
    image=models.ImageField(upload_to='course_image/',blank=False,verbose_name=_("Course Thumbnail"))

    courseid = models.ForeignKey(CourseId, null=True, blank=True,verbose_name=_("CourseId"), on_delete=models.CASCADE)
    scorm_type = models.CharField(verbose_name=_("Scorm type"),null=True, blank=True,max_length=60)
    student_id = models.CharField(verbose_name=_("Student id"),max_length=60)
    student_name = models.CharField(verbose_name=_("Student name"),max_length=60)
    lesson_location = models.CharField(verbose_name=_("Lesson location"),null=True, blank=True,max_length=60)
    max_score = models.CharField(verbose_name=_("Max score"),null=True, blank=True,max_length=60)
    raw_score = models.CharField(verbose_name=_("Raw score"),null=True, blank=True,max_length=60)
    min_score= models.CharField(verbose_name=_("Min score"),null=True, blank=True,max_length=60)
    lesson_mode = models.CharField(verbose_name=_("Lesson mode"),null=True, blank=True,max_length=60)
    lesson_status = models.CharField(verbose_name=_("Status"),null=True, blank=True,max_length=60)
    entry = models.CharField(verbose_name=_("Entry"),null=True, blank=True,max_length=60)
    credit = models.CharField(verbose_name=_("Credit"),null=True, blank=True,max_length=60)
    session_time = models.CharField(verbose_name=_("Session time"),null=True, blank=True,max_length=60)
    total_time = models.CharField(verbose_name=_("Total time"),null=True, blank=True,max_length=60)
    exit = models.CharField(verbose_name=_("Exit"),null=True, blank=True,max_length=60)
    suspend_data= models.CharField(verbose_name=_("Suspend Data"),null=True,blank=True,max_length=10000)

    scaled_passing_score=models.CharField(verbose_name=_("Scaled Passing Score"),null=True, blank=True,max_length=60)
    success_status=models.CharField(verbose_name=_("Success Status"),null=True, blank=True,max_length=60)
    progress_measure=models.CharField(verbose_name=_("Progress Measure"),null=True, blank=True,max_length=60)

    def __str__(self):
        return self.student_name

class Trainer(models.Model):
    courseid = models.ForeignKey(CourseId, null=True, blank=True,verbose_name=_("CourseId"), on_delete=models.CASCADE)
    trainer_name= models.ForeignKey(User, null=True, blank=True,verbose_name=_("Trainer Name"), on_delete=models.CASCADE)
    date=models.DateTimeField(default=timezone.now,null=True, blank=True,verbose_name=("Registered Date"))
