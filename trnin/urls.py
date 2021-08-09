"""trnin URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url
from django.urls import path,include,reverse_lazy
from user import views
import course.views
from messenger import views as msg
from django.views.generic.base import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from discuss import views as chat



urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^login/$', auth_views.LoginView.as_view(template_name="registration/login.html"), name="login"),
    path('', course.views.index, name='Home'),
    path('index',course.views.index),
    path('password_reset/', auth_views.PasswordResetView.as_view(html_email_template_name='registration/password_reset_html_email.html'),name='password_reset'),
    path('',include('django.contrib.auth.urls')),

    path('register/',views.register,name='register'),
    path('profile/',views.view_profile,name='profile'),
    path('users/',views.getuser,name='getuser'),
    path('profile/password/',views.change_password,name='change_password'),
    path('profile/edit/',views.edit_profile,name='edit_profile'),
    url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',views.activate, name='activate'),


    path('activate-mail/', TemplateView.as_view(template_name='registration/activate_mail_sent.html')),
    path('activated/', TemplateView.as_view(template_name='registration/activated.html')),

    url(r'^contact/$',msg.messages, name='contact'),
    path('blog/',course.views.blog,name='blog'),
    path('my_courses/',course.views.my_courses,name='my_courses'),
    url(r'^blog/(?P<id>\d+)/$',course.views.coursedesc,name='detail'),
    url(r'^blog/checkout/(?P<id>\d+)/$',course.views.checkout,name='checkout'),

    url(r'^course-info/(?P<courseid>[-\w]+)/$',course.views.coursehome,name='coursehome'),
    url(r'^course/(?P<courseid>[-\w]+)/$',course.views.playscorm,name='playscorm'),
    path('store_data/',course.views.store_data,name='store_data'),
    url(r'^discuss/(?P<courseid>[-\w]+)/$',chat.discuss,name='chat'),
    url(r'^getmessages/(?P<courseid>[-\w]+)/$',chat.messages,name='get_messages'),

    url(r'^post_messages/(?P<courseid>[-\w]+)/$',chat.postMessage,name='post_messages'),

    path('terms-of-service/',course.views.termsofservice,name='termsofservice'),
    path('about/',course.views.about,name='about'),
    url(r'^requirements/(?P<courseid>[-\w]+)/$',course.views.requirements,name='requirements'),
    url(r'^schedules/(?P<courseid>[-\w]+)/$',course.views.schedules,name='schedules'),
    url(r'^course_home/(?P<courseid>[-\w]+)/$',course.views.about_course,name='courseabout'),
    # url(r'^exam/(?P<courseid>[-\w]+)/$',course.views.exam,name='exam'),
    url(r'^progress/(?P<courseid>[-\w]+)/$',course.views.progress,name='progress'),
    # url(r'^add_question/(?P<courseid>[-\w]+)/$',course.views.add_question,name='add_question'),
    url(r'^messages_list/$',msg.messages_list,name='msg_list'),
    url(r'^send-message-to-admin/$',msg.messageToAdmin,name='message_to_admin'),
    url(r'^message/(?P<id>\d+)/$',msg.get_message,name='msg'),




]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
