from django.contrib import admin
from .models import CourseId, CourseDetails, Category, scormcontent

# Register your models here.
class CourseIdAdmin(admin.ModelAdmin):
    search_fields = ('courseid', )

class CategoryAdmin(admin.ModelAdmin):
    search_fields = ('category', )



class CourseDetailsAdmin(admin.ModelAdmin):


    list_display = ('name', 'courseid', )
    list_filter = ('courseid',)
    search_fields = ('description', 'courseid', )


class scormcontentAdmin(admin.ModelAdmin):

    list_display = ('title','courseid', )
    list_filter = ('courseid',)
    readonly_fields = ["slug",]
# class StudentAPIAdmin(admin.ModelAdmin):
#     list_display=('student_id','student_name',)
#     list_filter=('student_id',)

admin.site.register(Category,CategoryAdmin)


admin.site.register(CourseId, CourseIdAdmin)
admin.site.register(CourseDetails, CourseDetailsAdmin)

admin.site.register(scormcontent, scormcontentAdmin)
# admin.site.register(StudentAPI,StudentAPIAdmin)
