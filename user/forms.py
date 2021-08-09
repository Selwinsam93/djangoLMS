from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.utils.translation import ugettext_lazy as _, ugettext
from django_countries.fields import CountryField

# from accounts.models import UserProfile

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
class RegistrationForm(UserCreationForm):
    email = forms.EmailField(required=True,label="Email")
    phone_number = forms.CharField(label="Phone Number",required=True)
    country = CountryField().formfield(label="Country",required=True)
    gender=forms.ChoiceField(choices=gender,label="Gender",required=True)
    education=forms.ChoiceField(choices=edu,label="Highest level of education completed")
    about=forms.CharField(label="Tell us why you're interested in Trainocate")
    class Meta:
        model = User
        fields = ('email','first_name','last_name','username','password1','password2','phone_number','country','gender','education','about',)



class EditProfileForm(UserChangeForm):
    template_name='/something/else'

    class Meta:
        model = User
        fields = ('email','first_name','last_name','password',)
