from django.contrib import admin
from .models import UserProfile, Report, Message

# Register your models here.
admin.site.register(UserProfile)
admin.site.register(Report)
admin.site.register(Message)
