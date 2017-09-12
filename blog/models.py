from django.db import models
from datetime import datetime
from django.core.urlresolvers import reverse


# Create your models here.

class BlogPost(models.Model):
	author = models.CharField(max_length=255)
	date = models.DateTimeField(default=datetime.now)
	title = models.CharField(max_length=1024)
	image = models.ImageField(upload_to='blog', default='blog/thumbnail-default.jpg')
	content = models.TextField()

	codeschool = 'codeschool'
	cogitans = 'cogitans'
	droidclub = 'droidclub'
	ecell = 'ecell'
	electrotech = 'electrotech'
	oslc = 'oslc'
	renderedusict = 'renderedusict'
	turingai = 'turingai'

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

	def get_absolute_url(self):
		return reverse('blog:detail', kwargs={'pk': self.pk})



	def __str__(self):
		return self.title + ' - ' + self.get_club_display()

