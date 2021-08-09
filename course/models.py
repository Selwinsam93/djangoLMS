import re
import json
import csv
from django.db import models
from django.core.exceptions import ValidationError, ImproperlyConfigured
from django.core.validators import MaxValueValidator, validate_comma_separated_integer_list
from django.utils.timezone import now
from django.conf import settings
from django.utils.translation import ugettext as _
from model_utils.managers import InheritanceManager
from django.utils import timezone

import io
from django.contrib.auth.models import User
from django.contrib import messages

#UnZip function need to the below packages

from django.dispatch import receiver
from django.utils import timezone
from django.conf import settings
from django.utils.translation import ugettext_lazy as _, ugettext

import os
import shutil
from zipfile import ZipFile
from lxml import etree
import re
import json
from collections import defaultdict
from .helpers import RandomFileName
from django.db.models.signals import pre_save
from trnin.utils import unique_slug_generator

class CourseIdManager(models.Manager):

    def new_courseid(self, courseid):
        new_courseid = self.create(courseid=re.sub('\s+', '-', courseid)
                                   .lower())

        new_courseid.save()
        return new_courseid


class CourseId(models.Model):

    courseid = models.CharField(
        verbose_name=_("CourseId"),
        max_length=250, blank=True,
        unique=True, null=True)

    objects = CourseIdManager()

    class Meta:
        verbose_name = _("CourseId")
        verbose_name_plural = _("CourseId's")

    def __str__(self):
        return self.courseid


class CategoryManager(models.Manager):

    def new_category(self, category):
        new_category = self.create(category=re.sub('\s+', '-', category)
                                   .lower())

        new_category.save()
        return new_category




class Category(models.Model):

    category = models.CharField(
        verbose_name=_("Category"),
        max_length=250, blank=True,
        unique=True, null=True)
    objects = CategoryManager()

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = _("Categories")

    def __str__(self):
        return self.category



class CourseDetails(models.Model):

    category=models.ForeignKey(Category,null=True,blank=True,max_length=250,verbose_name=_("Category"),on_delete=models.CASCADE)

    name = models.CharField(verbose_name=_("Course Name"),max_length=250, blank=False)

    courseid = models.ForeignKey(CourseId, null=True, blank=True,verbose_name=_("CourseId"), on_delete=models.CASCADE)

    image=models.ImageField(upload_to=RandomFileName('course_image'),blank=False,verbose_name=_("Course Thumbnail"))

    start_date=models.DateTimeField(default=timezone.now,null=True, blank=True,verbose_name=("Start Date"))

    end_date=models.DateTimeField(null=True, blank=True,verbose_name=("End Date"))

    description = models.TextField(verbose_name=_("Course Description"),blank=True, help_text=_("a description of the Course"))

    # url = models.SlugField(
    #     max_length=60, blank=False,
    #     help_text=_("a user friendly url"),
    #     verbose_name=_("user friendly url"))

    course_requirements = models.TextField(blank=True, help_text=_("Course requirements."),verbose_name=_("Course requirements"))

    target_audience= models.TextField(verbose_name=_("Target Audience"),blank=True, help_text=_("Who need this course?"))
    duplicate_price=models.IntegerField(null=True, blank=True)
    original_price=models.IntegerField(null=True, blank=True)

    # def save(self, force_insert=False, force_update=False, *args, **kwargs):
    #     self.url = re.sub('\s+', '-', self.url).lower()
    #
    #     self.url = ''.join(letter for letter in self.url if
    #                        letter.isalnum() or letter == '-')
    #
    #
    #     super(CourseDetails, self).save(force_insert, force_update, *args, **kwargs)


    class Meta:
        verbose_name = _("CourseDetails")
        verbose_name_plural = _("CourseDetails")

    def __str__(self):
        return self.name

    # def __str__(self):
    #     return self.courseid

    def get_url(self):
        return reverse(detail,args=[self.id,self.url])



class ExtractPackageMixin(object):
    extract_folder = 'extracted_zips'

    @property
    def extracted_path(self):
        return os.path.join(settings.MEDIA_ROOT,self.extract_folder,self.__class__.__name__,str(self.slug))

    @property
    def extracted_url(self):
        return '{}{}/{}/{}'.format(settings.MEDIA_URL,self.extract_folder,self.__class__.__name__,str(self.slug))

@receiver(models.signals.post_save)
def extract_package(sender,instance,**kwargs):
    if not issubclass(sender,ExtractPackageMixin):
        return
    if os.path.exists(instance.extracted_path):
        shutil.rmtree(instance.extracted_path)
    os.makedirs(instance.extracted_path)
    z = ZipFile(instance.package.file,'r')
    z.extractall(instance.extracted_path)

SCORM=(
('SCORM 1.2','SCORM 1.2'),
('SCORM 2004','SCORM 2004')
)

class scormcontent(ExtractPackageMixin,models.Model):

    title=models.CharField(verbose_name=_("Title"),max_length=250)
    slug = models.SlugField(max_length=250, null=True, blank=True,help_text=_("a user friendly url"),verbose_name=_("user friendly url"))
    courseid = models.ForeignKey(CourseId, null=True, blank=True,verbose_name=_("CourseId"), on_delete=models.CASCADE)
    scorm_type=models.CharField(max_length=40,choices=SCORM, null=True, blank=True)
    package = models.FileField(upload_to=RandomFileName('course'),verbose_name='SCORM file')
    def __str__(self):
        return self.title
def slug_generator(sender,instance,*args,**kwargs):
    if not instance.slug:
        instance.slug=unique_slug_generator(instance)

pre_save.connect(slug_generator,sender=scormcontent)
