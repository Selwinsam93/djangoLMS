from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm, UserChangeForm,PasswordChangeForm
from django.contrib.auth import authenticate,login
from user.forms import EditProfileForm,RegistrationForm
from django.contrib.auth import update_session_auth_hash
from course.models import CourseDetails
from .models import Profile
from messenger.models import Contact
from django.contrib import messages as info
from django.contrib.auth.models import User
# Create your views here.

from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from .tokens import account_activation_token
#from django.contrib.auth.models import User
from django.core.mail import EmailMessage
from django.http import HttpResponse
from django.contrib import auth









def getuser(request):
    data=User.objects.all()
    data2=Profile.objects.all()
    return render(request,'test.html',{'data':data,'data2':data2})

def login(request):
     return render(request,'login.html')

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()

            user.profile.phone_number = form.cleaned_data.get('phone_number')
            user.profile.country = form.cleaned_data.get('country')
            user.profile.gender = form.cleaned_data.get('gender')
            user.profile.education = form.cleaned_data.get('education')
            user.profile.about = form.cleaned_data.get('about')
            user.is_active = False
            user.save()

            current_site = get_current_site(request)
            mail_subject = 'Activate your Trainocate account.'
            message = render_to_string('mail_templates/acc_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid':urlsafe_base64_encode(force_bytes(user.pk)),
                'token':account_activation_token.make_token(user),
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                        mail_subject, message, to=[to_email]
            )
            email.content_subtype = "html"
            email.send()
            return redirect('/activate-mail')


            #-----------------------------------
            #Here is the error
            # profile = user.profile
            # profile.phone = phone
            #-------------------------------
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            # user = authenticate(username=username, password=raw_password)
            # login(request, user)
            #return redirect('/login')
    else:
        form = RegistrationForm()
    return render(request, 'register.html', {'form': form})


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        #login(request, user)
        # return redirect('home')
        #info.success(request,'Thank you for your email confirmation. Now you can login your account.')
        return redirect('/activated')
    else:
        return HttpResponse('Activation link is invalid!')


def view_profile(request, pk=None):
    if pk:
        user = User.objects.get(pk=pk)
    else:
        user = request.user
    args = {'user': user}
    return render(request, 'accounts/profile.html', args)

def edit_profile(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)

        if form.is_valid():
            form.save()
            return redirect('/profile')
    else:
        form = EditProfileForm(instance=request.user)
        args = {'form': form}
        return render(request, 'accounts/edit_profile.html', args)

def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(data=request.POST, user=request.user)

        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('/profile')
        else:

            return redirect('/profile/password')
    else:
        form = PasswordChangeForm(user=request.user)

        args = {'form': form}
        return render(request, 'accounts/change_password.html', args)
