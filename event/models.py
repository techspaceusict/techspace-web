from django.db import models

# Create your models here.

class Events(models.Model):
	title = models.CharField(max_length=255)
	date = models.DateTimeField()
	venue = models.CharField(max_length=1024)
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
		return self.title + ' - ' + self.club