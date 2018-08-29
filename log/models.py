from django.db import models
import datetime
from django.contrib.auth.models import User
from django.utils.translation import gettext as _
from home.models import Club
from blog.models import BlogPost, Comments

from ckeditor_uploader.fields import RichTextUploadingField

from cloudinary.models import CloudinaryField

# Create your models here.




class UserProfile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	name = models.CharField(max_length=255, blank=True)
	email = models.CharField(max_length=255, unique=True)
	institution = models.CharField(max_length=255, blank=True)
	course = models.CharField(max_length=255, blank=True)

	YEAR_CHOICES = []
	for r in range((datetime.datetime.now().year), (datetime.datetime.now().year+10)):
	    YEAR_CHOICES.append((r,r))

	year_of_graduation = models.IntegerField(_('year'), choices=YEAR_CHOICES, default=datetime.datetime.now().year)

	bio = models.TextField(blank=True)
	facebook = models.URLField(blank=True)
	twitter = models.URLField(blank=True)
	github = models.URLField(blank=True)
	linkedIn = models.URLField(blank=True)
	profile_pic = CloudinaryField('image', blank=True)
	club = models.ManyToManyField(Club, blank=True)
	email_activated = models.BooleanField(default=False)

	user_badge_icon = models.CharField(max_length=255, blank=True, null=True)
	user_badge_text = models.CharField(max_length=255, blank=True, null=True)
	last_login_time = models.DateTimeField(blank=True, null=True)
	ip_address = models.CharField(blank=True, max_length=255)
	user_agent = models.CharField(blank=True, max_length=1024)

	def __str__(self):
		return self.user.username

class Report(models.Model):
	reported_user = models.ForeignKey(UserProfile, related_name='reported_user', on_delete=models.CASCADE)
	reported_by = models.ForeignKey(UserProfile, related_name='reported_by', on_delete=models.CASCADE)
	reason = models.TextField()
	resolved = models.BooleanField(default=False)

	def __str__(self):
		return self.reported_user.user.username

class Message(models.Model):
	sender = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='sent')
	receiver = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='received')
	content = RichTextUploadingField()
	date = models.DateTimeField(default=datetime.datetime.now)

	def __str__(self):
		return self.sender.user.username + '-' + self.receiver.user.username

class Notification(models.Model):
	user = models.ForeignKey(UserProfile, related_name='notifications', on_delete=models.CASCADE)
	post = models.ForeignKey(BlogPost, on_delete=models.CASCADE, null=True, blank=True)
	comment = models.ForeignKey(Comments, on_delete=models.CASCADE, related_name='notifs', null=True, blank=True)
	like_notification = 'like_notification'
	comment_notification = 'comment_notification'
	message_notification = 'message_notification'
	comment_mention_notification = 'comment_mention_notification'
	post_mention_notification = 'post_mention_notification'
	type_choices = (
		(like_notification, 'like_notification'),
		(comment_notification, 'comment_notification'),
		(message_notification, 'message_notification'),
		(comment_mention_notification, 'comment_mention_notification'),
		(post_mention_notification, 'post_mention_notification'),
	)
	type = models.CharField(max_length=200, choices=type_choices)

	def __str__(self):
		return self.user.user.username
