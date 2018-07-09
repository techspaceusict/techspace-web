from django.db import models
from django.template.defaultfilters import slugify

# Create your models here.

class Events(models.Model):
	title = models.CharField(max_length=255)
	author = models.CharField(max_length=255)
	date = models.DateField()
	time = models.TimeField()
	image = models.ImageField(upload_to='events', default='blog/thumbnail-default.jpg')
	venue = models.CharField(max_length=1024)
	content = models.TextField()
	slug = models.SlugField(db_index=True, unique=True, max_length=2024)

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
		return reverse('event:detail', args=[self.id, self.slug])

	def save(self, *args, **kwargs):
		if not self.id:
			self.slug = slugify(self.title)
		super(Events, self).save(*args, **kwargs)


	def __str__(self):
		return self.title + ' - ' + self.club
