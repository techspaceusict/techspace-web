from django.db import models

# Create your models here.
class Contact(models.Model):
	name = models.CharField(max_length=255)
	app_name = models.CharField(max_length=255, blank=True)
	email = models.EmailField(max_length=255)
	content = models.TextField()

	def __str__(self):
		return self.name + '-' + self.email + '-' + self.app_name

class Club(models.Model):
	club_name = models.CharField(max_length=255)
	captain = models.CharField(max_length=255, default='null')
	club_image = models.ImageField(upload_to='logo')

	def __str__(self):
		return self.club_name

class Association(models.Model):
	company = models.CharField(max_length=255)
	company_img = models.ImageField(upload_to='associations')

	def __str__(self):
		return self.company


class Info(models.Model):
	author = models.CharField(max_length=255)
	title = models.CharField(max_length=255)
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

	club = models.CharField(max_length=255, choices=club_choices)

	def __str__(self):
		return self.title + '-' + self.get_club_display()


class Team(models.Model):
	name = models.CharField(max_length=255)
	image = models.ImageField(upload_to='clubs/team')
	designation = models.CharField(max_length=255)
	facebook = models.URLField(null=True)
	github = models.URLField(null=True)
	linkedin =  models.URLField(null=True)

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

	club = models.CharField(max_length=255, choices=club_choices)

	def __str__(self):
		return self.name + '-' + self.get_club_display()




