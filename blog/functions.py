from log.models import UserProfile, Notification
from django.utils.html import strip_tags, escape

def processBlog(blog, request):
    text = blog.content
    mentions = [ t for t in text.split() if t.startswith('@') ]
    for mention in mentions:
        name = mention[1:]
        try:
            user = UserProfile.objects.get(user__username=name)
        except:
            user = None
        if user is not None:
            replace_text = '<a href="http://' + request.META['HTTP_HOST'] + '/' + mention + '/">' + mention + '</a>'
            text = text.replace(mention, replace_text)
            Notification.objects.create(
                user=user,
                type=Notification.post_mention_notification,
                post=blog,
            )
    blog.content = text
    blog.save()

def processPost(post, request):
    text = escape(post.content)
    mentions = [ t for t in text.split() if t.startswith('@') ]
    for mention in mentions:
        name = mention[1:]
        try:
            user = UserProfile.objects.get(user__username=name)
        except:
            user = None
        if user is not None:
            replace_text = '<a href="http://' + request.META['HTTP_HOST'] + '/' + mention + '/">' + mention + '</a>'
            text = text.replace(mention, replace_text)
            Notification.objects.create(
                user=user,
                type=Notification.post_mention_notification,
                post=post,
            )
    post.content = text
    post.save()

def processComment(comment, request):
    text = escape(comment.comment_text)
    mentions = [ t for t in text.split() if t.startswith('@') ]
    for mention in mentions:
        name = mention[1:]
        try:
            user = UserProfile.objects.get(user__username=name)
        except:
            user = None
        if user is not None:
            replace_text = '<a href="http://' + request.META['HTTP_HOST'] + '/' + mention + '/">' + mention + '</a>'
            text = text.replace(mention, replace_text)
            Notification.objects.create(
                user=user,
                type=Notification.comment_mention_notification,
                comment=comment,
                post=comment.post,
            )
    comment.comment_text = text
    comment.save()
