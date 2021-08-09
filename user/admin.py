from django.contrib import admin
from .models import Profile, Enrollment

# Register your models here.
class ProfileAdmin(admin.ModelAdmin):
    search_fields = ('user', )
    list_display = ('user', 'country', )

class EnrollmentAdmin(admin.ModelAdmin):
    search_fields = ('student_name','courseid','scorm_type' )
    list_display = ('student_name', 'student_id','courseid', 'scorm_type')

admin.site.register(Profile, ProfileAdmin)

admin.site.register(Enrollment, EnrollmentAdmin)
