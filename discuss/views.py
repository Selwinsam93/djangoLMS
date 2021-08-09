from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from django.http import JsonResponse
from django.core import serializers
# Create your views here.
from django.contrib.auth.decorators import login_required, permission_required
from django.core.exceptions import PermissionDenied
from django.http import HttpResponseRedirect,HttpResponse
from django.utils import timezone
from course.models import CourseDetails,CourseId,Category, scormcontent
from user.models import Enrollment
from .models import Discussion
from user.models import Trainer

@login_required(login_url="/login/")
def discuss(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    instance=get_object_or_404(CourseDetails,courseid=courseid)
    trainer=Trainer.objects.filter(courseid=courseid)
    if trainer:
        trainerid=str(trainer[0].trainer_name.id)
        trainername=trainer[0].trainer_name
    else:
        trainerid="No trainer"
        trainername="No trainer"
    print(type(trainerid))
    course_enroll=Enrollment.objects.filter(courseid=courseid)
    chat=Discussion.objects.filter(courseid=courseid)
    for x in chat:
        print(type(x.student_id))
    user_id=str(request.user.id)
    for student in course_enroll:
        if user_id in student.student_id:


            data={
                    'courseid':courseid,
                    'chat':chat,
                    'trainer':trainer,
                    'trainerid':trainerid,
                    'trainername':trainername,

                    }

            return render(request,'discuss.html',data)
    return redirect(reverse('detail', kwargs={"id": instance.id}))

@login_required(login_url="/login/")
def postMessage(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    if request.method == 'POST':
        message=request.POST.get('message')

        student_name=request.user
        student_id=request.user.id
        courseid=courseid
        dis=Discussion()
        dis.courseid=courseid
        dis.student_name=student_name
        dis.student_id=student_id
        dis.message=message
        dis.save()
        return JsonResponse({ 'msg': message, 'user': request.user.username,'time':timezone.now()})
    else:
        return HttpResponse('Request must be POST.')

@login_required(login_url="/login/")
def messages(request,courseid):
    courseid=get_object_or_404(CourseId,courseid=courseid)
    chat=Discussion.objects.filter(courseid=courseid)
    courseid=get_object_or_404(CourseId,courseid=courseid)
    trainer=Trainer.objects.filter(courseid=courseid)
    if trainer:
        trainerid=str(trainer[0].trainer_name.id)
        trainername=trainer[0].trainer_name
    else:
        trainerid="No trainer"
        trainername="No trainer"
    return render(request,'messages.html',{'chat':chat,'trainerid':trainerid})
