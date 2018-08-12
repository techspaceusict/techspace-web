from django.contrib import admin

# Register your models here.
from .models import Latestpost

admin.site.register(Latestpost, prepopulated_fields = {"slug": ("title",),}) 
