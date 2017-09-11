from django.contrib import admin
from .models import Contact, Club, Association, Info, Team 
# Register your models here.
admin.site.register(Contact, list_display=['name', 'email','content','app_name'])
admin.site.register(Club)
admin.site.register(Association)
admin.site.register(Info)
admin.site.register(Team)