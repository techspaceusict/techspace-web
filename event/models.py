from django.db import models

# Create your models here.

class Events(models.Model):
	title = models.CharField(max_length=255)
	date = models.DateTimeField()
	venue = models.CharField(max_length=1024)
	content = models.TextField()


	def __str__(self):
		return self.title