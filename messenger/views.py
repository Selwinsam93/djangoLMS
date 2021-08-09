from django.shortcuts import render,get_object_or_404,redirect
from .models import Contact
from django.contrib import messages as info
from django.http import HttpResponseRedirect,HttpResponse,JsonResponse

def messages(request):

    return render(request,'contact.html',{'msg':'Test'})
def messages_list(request):
    contact=Contact.objects.all()
    return render(request,'messages_list.html',{'contact':contact})


def get_message(request,id):
    instance=get_object_or_404(Contact,id=id)

    return render(request,'message.html',{'instance':instance})
def messageToAdmin(request):
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
        return JsonResponse({ 'msg': 'Message has been sent successfully'})
    else:
        return HttpResponse('Request must be POST.')
