from django.db import models

# Create your models here.
from django.utils.translation import ugettext as _
from course.models import CourseId

from django.utils import timezone

class Discussion(models.Model):
    courseid = models.ForeignKey(CourseId, null=True, blank=True,verbose_name=_("CourseId"), on_delete=models.CASCADE)
    sent_date=models.DateTimeField(default=timezone.now,null=True, blank=True,verbose_name=("Sent Date"))
    student_name = models.CharField(verbose_name=_("Student name"),max_length=60)
    student_id = models.CharField(verbose_name=_("Student id"),max_length=60)
    message=models.TextField(verbose_name=_("Message contents"),blank=True)
