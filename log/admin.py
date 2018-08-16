from django.contrib import admin
from .models import UserProfile, Report, Message, Notification

# Register your models here.
admin.site.register(UserProfile)
admin.site.register(Report)
admin.site.register(Message)
admin.site.register(Notification)
