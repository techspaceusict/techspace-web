from log.models import UserProfile, Notification
from django.utils.html import strip_tags


def find_mentions(blog, request):
    text = strip_tags(blog.content)
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

def find_comment_mentions(comment, request):
    text = unicode(comment.comment_text, 'utf-8')
    text = strip_tags(text)
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
