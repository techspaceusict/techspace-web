from django.db import models
# from datetime import datetime


# Create your models here.
class Info(models.Model):
	author = models.CharField(max_length=255)
	title = models.CharField(max_length=255)
	content = models.TextField()

	def __str__(self):
		return self.author + self.title

class Team(models.Model):
	name = models.CharField(max_length=255)
	image = models.ImageField(upload_to='clubs/codeschool/team')
	designation = models.CharField(max_length=255)
	facebook = models.URLField(null=True)
	github = models.URLField(null=True)
	twitter =  models.URLField(null=True)

	def __str__(self):
		return self.name + self.designation



