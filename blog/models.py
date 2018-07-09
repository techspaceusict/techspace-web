from django.db import models
from django.template.defaultfilters import slugify
from django.utils.translation import ugettext_lazy as _
from datetime import datetime
from django.core.urlresolvers import reverse


# Create your models here.

class BlogPost(models.Model):
	author = models.CharField(max_length=255)
	date = models.DateTimeField(default=datetime.now)
	title = models.CharField(max_length=1024, unique=True)
	image = models.ImageField(upload_to='blog', default='blog/thumbnail-default.jpg')
	content = models.TextField()
	slug = models.SlugField(_('slug'), db_index=True, max_length=2024, unique=True)


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
		return reverse('blog:detail', args=[self.id, self.slug])


	def save(self, *args,**kwargs):
		if not self.id:
			self.slug = slugify(self.title)
		super(BlogPost, self).save(*args, **kwargs)


	def __str__(self):
		return self.title + ' - ' + self.author + ' - ' + self.get_club_display()

class Comments(models.Model):
	post = models.ForeignKey(BlogPost, related_name='comments', on_delete=models.CASCADE)
	comment_author = models.CharField(max_length=200)
	comment_text = models.TextField()
	comment_date = models.DateTimeField(default=datetime.now)
	active = models.BooleanField(default=True)

	def __str__(self):
		return self.post.title + ' - ' + self.comment_author
