from django.db import models
from datetime import datetime


# Create your models here.

class BlogPost(models.Model):
	author = models.CharField(max_length=1024)
	date = models.DateTimeField(default=datetime.now)
	title = models.CharField(max_length=1024)
	image = models.ImageField(upload_to='blog', default='blog/thumbnail-default.jpg')
	content = models.TextField()

	codeschool = 'cs'
	cogitans = 'ct'
	droidclub = 'dc'
	ecell = 'ec'
	electrotech = 'et'
	oslc = 'os'
	renderedusict = 'ru'
	turingai = 'ta'

	club_choices = (
			(codeschool, 'Codeschool'),
			(cogitans, 'Cogitans'),
			(droidclub, 'Droid Club'),
			(ecell, 'E-Cell'),
			(electrotech, 'Electrotech'),
			(oslc, 'OSLC'),
			(renderedusict, 'Rendered-USICT'),
			(turingai, 'Turing A.I.'),

		)

	club = models.CharField(max_length=200, choices=club_choices, blank=True)


	def __str__(self):
		return self.title + ' - ' + self.get_club_display()

