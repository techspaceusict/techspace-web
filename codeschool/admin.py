from django.contrib import admin

# from blog.models import BlogPost
from .models import Info, Team
# Register your models here.


admin.site.register(Info)
admin.site.register(Team)
# admin.site.register(BlogPost)