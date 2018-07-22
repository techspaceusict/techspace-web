from django.db import models
import datetime
from django.contrib.auth.models import User
from django.utils.translation import gettext as _

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
	club_choice = (
		('none', 'none'),
		('codeschool', 'codeschool'),
		('cogitans', 'cogitans'),
		('ecell', 'ecell'),
		('electrotech', 'electrotech'),
		('oslc', 'oslc'),
		('renderedusict', 'renderedusict'),
		('turingai', 'turingai'),
		('techspace', 'techspace')
	)

	club = models.CharField(max_length=255, choices=club_choice, default='none')

	def __str__(self):
		return self.user.username
