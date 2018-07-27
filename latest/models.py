from django.db import models

# Create your models here.

from datetime import datetime

class Latestpost(models.Model) :

    title = models.CharField(max_length=255)
    datetime = models.DateTimeField(default=datetime.now)
    content = models.TextField()

    def __str__(self):
    	return self.title