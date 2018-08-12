from django.contrib import admin
from .models import Events
# Register your models here.


admin.site.register(Events,prepopulated_fields = {"slug": ("title",),})
