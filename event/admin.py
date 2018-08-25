from django.contrib import admin
from .models import AddEvent
# Register your models here.


admin.site.register(AddEvent, prepopulated_fields = {"slug": ("title",),})
