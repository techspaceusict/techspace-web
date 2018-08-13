from django.contrib import admin
from .models import BlogPost, Comments, Tag, Upvote, CommentUpvote

# Register your models here.

admin.site.register(BlogPost,prepopulated_fields = {"slug": ("title",),})
admin.site.register(Comments, list_display=['comment_author', 'comment_text', 'comment_date'])

admin.site.register(Tag)
admin.site.register(Upvote)
admin.site.register(CommentUpvote)
