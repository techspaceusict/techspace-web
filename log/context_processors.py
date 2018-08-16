from .models import UserProfile, Message, Notification

def get_user_profile(request):
    if request.user.is_authenticated:
        user = UserProfile.objects.get(user=request.user)
        return {'userprofile': user}

def get_user_notifications(request):
    if request.user.is_authenticated:
        user = UserProfile.objects.get(user=request.user)
        notification_count = len(Notification.objects.filter(user=user))
        message_notifications = Notification.objects.filter(user=user, type=Notification.message_notification)
        upvote_notifications = Notification.objects.filter(user=user, type=Notification.like_notification)
        comment_notifications = Notification.objects.filter(user=user, type=Notification.comment_notification)
        return {
            'message_notifications': message_notifications,
            'upvote_notifications': upvote_notifications,
            'comment_notifications': comment_notifications,
            'notification_count': notification_count,
        }
