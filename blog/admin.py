from django.contrib import admin
from .models import BlogPost, Comments, Upvote
# Register your models here.

admin.site.register(BlogPost)
admin.site.register(Comments, list_display=['comment_author', 'comment_text', 'comment_date'])
admin.site.register(Upvote)

