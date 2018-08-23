from django.contrib import admin
from .models import UserProfile, Report, Message, Notification

# Register your models here.
admin.site.register(UserProfile, list_display=['user','name' , 'email', 'course', 'institution', 'year_of_graduation', 'user_badge_text'])
admin.site.register(Report)
admin.site.register(Message)
admin.site.register(Notification)
