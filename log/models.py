from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class UserProfile(models.Model):
	user = models.OneToOneField(User)

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
