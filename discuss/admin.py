from django.contrib import admin
from .models import Discussion
from user.models import Trainer
# Register your models here.
class DiscussionAdmin(admin.ModelAdmin):
    search_fields = ('student_name', )
    list_display = ('student_name', 'message', )
admin.site.register(Discussion,DiscussionAdmin)

class TrainerAdmin(admin.ModelAdmin):
    search_fields = ('courseid', )
    list_display = ('courseid', 'trainer_name', )
admin.site.register(Trainer,TrainerAdmin)
