from django.db import models
from datetime import datetime


# Create your models here.

class BlogPost(models.Model):
	author = models.CharField(max_length=1024)
	date = models.DateTimeField(default=datetime.now)
	title = models.CharField(max_length=1024)
	image = models.ImageField(upload_to='blog', default='blog/thumbnail-default.jpg')
	content = models.TextField()


	def __str__(self):
		return self.title

