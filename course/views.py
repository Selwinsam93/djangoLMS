from django.contrib.auth.decorators import login_required, permission_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, render
from django.utils.decorators import method_decorator
from django.views.generic import DetailView, ListView, TemplateView
from django.views.generic.edit import FormView
from .models import CourseDetails,CourseId,Category, scormcontent
from messenger.models import Contact
from user.models import Enrollment
from django.db.models import Count
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages as info
from django.utils import timezone
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
# from .forms import ProgressForm
from django.http import HttpResponseRedirect,HttpResponse
from django.urls import reverse
import sys
from django.conf import settings
import stripe



stripe.api_key = settings.STRIPE_SECRET_KEY



def index(request):
    blogs=CourseDetails.objects.all()
    blogs1=blogs.filter(category__category__icontains="Trainocate")
    blogs2=blogs.filter(category__category__icontains="Cisco")
    blogs3=blogs.filter(category__category__icontains="Microsoft")
    if request.method == 'POST':

        name=request.POST.get('name')
        email=request.POST.get('email')
        subject=request.POST.get('subject')
        message=request.POST.get('message')

        c=Contact()
        c.name=name
        c.email=email
        c.subject=subject
        c.messages=message
        c.save()

        info.success(request, 'Message sent successfully.')
    context={
    'blogs1':blogs1,
    'blogs2':blogs2,
    'blogs3':blogs3
    }
    return render(request,'index.html',context)





#Courses Blog



def blog(request):

    blogs2=CourseDetails.objects.all().values('category').annotate(total=Count('category'))
    cate=Category.objects.all().order_by('category')[::-1]
    clist= list(cate)
    listb = list(blogs2)
    dat=zip(clist, listb)

    blogs1=CourseDetails.objects.all()
    blogs=CourseDetails.objects.all()


    query=request.GET.get("q")
    if query:
        blogs=blogs.filter(name__icontains=query)

    query=request.GET.get("filter")
    if query:
        blogs=blogs.filter(category__category__icontains=query)



    blogcourse={
    'blogs':blogs,
    'dat':dat,
    'blogs1':blogs1,
    }

    return render(request,'blog-single.html',blogcourse)


#my courses
@login_required(login_url="/login/")
def my_courses(request):

    enrolled_courses=Enrollment.objects.filter(student_id=request.user.id)
    query=request.GET.get("q")
    if query:
        enrolled_courses=enrolled_courses.filter(course_name__icontains=query)

    blogcourse={

    'enrolled_courses':enrolled_courses,

    }

    return render(request,'my_courses.html',blogcourse)



#Course Description

def coursedesc(request,id):
    instance=get_object_or_404(CourseDetails,id=id)
    courseid=instance.courseid
    scorm_type=get_object_or_404(scormcontent,courseid=courseid)
    enrolled_student=Enrollment.objects.filter(courseid=courseid)
    student_id1=enrolled_student.filter(student_id=request.user.id)
    user_id=str(request.user.id)
    student_id="No"
    for sid in enrolled_student:
        if user_id in sid.student_id:
            student_id=user_id

    # if 'enroll' in request.POST:
    #     student_name = request.POST.get('student_name')
    #     enroll = Enrollment()
    #     enroll.courseid=courseid
    #     enroll.scorm_type=scorm_type.scorm_type
    #     enroll.student_id=request.user.id
    #     enroll.student_name=student_name
    #     enroll.save()
    context={
        "name":instance.name,
        "instance":instance,
        "enrolled_student":enrolled_student,
        "scorm":scorm_type,
        "user_id":user_id,
        "student_id":student_id,

    }
    return render(request,'coursedesc.html',context)

@login_required(login_url="/login/")
def checkout(request,id):
    instance=get_object_or_404(CourseDetails,id=id)
    courseid=instance.courseid
    course_name=instance.name
    category=instance.category
    image=instance.image
    price=instance.original_price*100
    save=instance.duplicate_price-instance.original_price
    scorm_type=get_object_or_404(scormcontent,courseid=courseid)
    enrolled_student=Enrollment.objects.filter(courseid=courseid)
    en=enrolled_student.filter(student_id=request.user.id)
    user_id=str(request.user.id)
    des =str(courseid)
    if request.method == 'POST':
        charge = stripe.Charge.create(
            amount=price,
            currency='inr',
            description='Payment for '+des,
            source=request.POST['stripeToken'])
        enrolled_date=default=timezone.now()
        student_name = request.user.username
        enroll = Enrollment()
        enroll.enrolled_date=enrolled_date
        enroll.course_name=course_name
        enroll.category=category
        enroll.image=image
        enroll.courseid=courseid
        enroll.scorm_type=scorm_type.scorm_type
        enroll.student_id=request.user.id
        enroll.student_name=student_name
        enroll.save()
        return redirect(reverse('coursehome', kwargs={"courseid": instance.courseid}))

    home={
    "key":settings.STRIPE_PUBLISHABLE_KEY,
    "instance":instance,
    "save":save,
    "price":price
    }
    return render(request,'checkout.html',home)



#course Home
@login_required(login_url="/login/")
def coursehome(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    instance=get_object_or_404(CourseDetails,courseid=courseid)
    scorm_type=get_object_or_404(scormcontent,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)
    scormcourse=scormcontent.objects.filter(courseid=courseid)
    course_enroll=Enrollment.objects.filter(courseid=courseid)
    student_data=course_enroll.filter(student_id=request.user.id)
    user_id=str(request.user.id)

    for student in course_enroll:
        if user_id in student.student_id:
            home={
                    'courseid':courseid,
                    'cohome':cohome,
                    'scormcourse':scormcourse,
                    'student_data':student_data,
                    "scorm":scorm_type,
                    }

            return render(request,'course_home.html',home)
    return redirect(reverse('detail', kwargs={"id": instance.id}))

@login_required(login_url="/login/")
def playscorm( request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    instance=get_object_or_404(CourseDetails,courseid=courseid)
    scorm_type=get_object_or_404(scormcontent,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)
    scormcourse=scormcontent.objects.filter(courseid=courseid)
    course_enroll=Enrollment.objects.filter(courseid=courseid)
    student_data=course_enroll.filter(student_id=request.user.id)
    user_id=str(request.user.id)

    for student in course_enroll:
        if user_id in student.student_id:
            home={
                    'courseid':courseid,
                    'cohome':cohome,
                    'scormcourse':scormcourse,
                    'student_data':student_data,
                    "scorm":scorm_type,
                }

            return render(request,'scorm_frame.html',home)

    return redirect(reverse('detail', kwargs={"id": instance.id}))

def store_data(request):
    if request.method =='POST':

        enroll_id=request.POST.get('enroll_id')
        student_id=request.POST.get('student_id')
        student_name=request.POST.get('student_name')
        lesson_location=request.POST.get('lesson_location')
        max_score=request.POST.get('max_score')
        raw_score=request.POST.get('raw_score')
        lesson_mode = request.POST.get('lesson_mode')
        lesson_status =request.POST.get('lesson_status')
        entry =request.POST.get('entry')
        credit =request.POST.get('credit')
        session_time =request.POST.get('session_time')
        total_time =request.POST.get('total_time')
        exit =request.POST.get('exit')
        suspend_data=request.POST.get('suspend_data')

        scaled_passing_score =request.POST.get('scaled_passing_score')
        success_status =request.POST.get('success_status')
        progress_measure=request.POST.get('progress_measure')

        enroll=Enrollment.objects.get(id=enroll_id)

        enroll.lesson_location=lesson_location
        enroll.max_score=max_score
        enroll.raw_score=raw_score
        enroll.lesson_mode=lesson_mode
        enroll.lesson_status=lesson_status
        enroll.entry=entry
        enroll.credit=credit
        enroll.session_time=session_time
        enroll.total_time=total_time
        enroll.exit=exit
        enroll.suspend_data=suspend_data

        enroll.scaled_passing_score=scaled_passing_score
        enroll.success_status=success_status
        enroll.progress_measure=progress_measure
        enroll.save()

        return HttpResponse('')

@login_required(login_url="/login/")
def progress(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    instance=get_object_or_404(CourseDetails,courseid=courseid)
    scorm_type=get_object_or_404(scormcontent,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)
    scormcourse=scormcontent.objects.filter(courseid=courseid)
    course_enroll=Enrollment.objects.filter(courseid=courseid)
    student_data=course_enroll.filter(student_id=request.user.id)
    user_id=str(request.user.id)

    for student in course_enroll:
        if user_id in student.student_id:
            home={
                        'courseid':courseid,
                        'cohome':cohome,
                        'scormcourse':scormcourse,
                        'student_data':student_data,
                        "scorm":scorm_type,
                    }

            return render(request,'Progress.html',home)
    return redirect(reverse('detail', kwargs={"id": instance.id}))



#Course Requirements

def requirements(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)

    home={
    'courseid':courseid,
    'cohome':cohome
    }

    return render(request,'requirements.html',home)




def about_course(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)

    home={
    'courseid':courseid,
    'cohome':cohome
    }

    return render(request,'about_course.html',home)

#Course schedules

def schedules(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    cohome=CourseDetails.objects.filter(courseid=courseid)

    home={
    'courseid':courseid,
    'cohome':cohome
    }

    return render(request,'schedules.html',home)


def contact(request):
     return render(request,'contact.html')

def about(request):
     return render(request,'about.html')

def termsofservice(request):
     return render(request,'termsofservice.html')
