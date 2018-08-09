from django.db import models
import datetime
from django.contrib.auth.models import User
from django.utils.translation import gettext as _
from home.models import Club

from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.




class UserProfile(models.Model):
	user = models.OneToOneField(User)
	institution = models.CharField(max_length=255, blank=True)
	course = models.CharField(max_length=255, blank=True)

	YEAR_CHOICES = []
	for r in range((datetime.datetime.now().year), (datetime.datetime.now().year+10)):
	    YEAR_CHOICES.append((r,r))

	year_of_graduation = models.IntegerField(_('year'), choices=YEAR_CHOICES, default=datetime.datetime.now().year)

	bio = models.TextField(blank=True)
	email = models.URLField(blank=True)
	facebook = models.URLField(blank=True)
	twitter = models.URLField(blank=True)
	github = models.URLField(blank=True)
	linkedIn = models.URLField(blank=True)
	profile_pic = models.ImageField(upload_to='user/avatar/', default='default/Default_avatar.jpg')
	club = models.ManyToManyField(Club)

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
	read = models.BooleanField(default=False)

	def __str__(self):
		return self.sender.user.username + '-' + self.receiver.user.username
