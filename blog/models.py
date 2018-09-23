from django.db import models
from django.template.defaultfilters import slugify
from django.utils.translation import ugettext_lazy as _
from datetime import datetime
from django.urls import reverse
from django.core.urlresolvers import reverse

from django.contrib.auth.models import User

from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

from cloudinary.models import CloudinaryField

# Create your models here.

class Tag(models.Model):
	word = models.CharField(max_length=100)

	def __str__(self):
		return self.word


class BlogPost(models.Model):
	author = models.CharField(max_length=255)
	date = models.DateTimeField(default=datetime.now)
	title = models.CharField(max_length=1024, unique=True)
	image = CloudinaryField('image')
	content = RichTextUploadingField()
	slug = models.SlugField(_('slug'), db_index=True, max_length=2024, unique=True)
	tags = models.ManyToManyField(Tag, blank=True)
	isblog = models.BooleanField(default=True)
	pinned = models.BooleanField(default=False)
	description = models.TextField(null=True, blank=True)


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
		return self.title + ' - ' + self.author

	def get_absolute_url(self):
		return reverse('post', args=[str(self.id)])

class Comments(models.Model):
	post = models.ForeignKey(BlogPost, related_name='comments', on_delete=models.CASCADE)
	comment_author = models.CharField(max_length=200)
	comment_text = models.TextField()
	comment_date = models.DateTimeField(default=datetime.now)
	reply_for = models.ForeignKey('self', on_delete=models.CASCADE, related_name='replies', null=True, default=None)
	active = models.BooleanField(default=True)

	def __str__(self):
		return self.post.title + ' - ' + self.comment_author


class Upvote(models.Model):
	title = models.CharField(max_length=1024 , null = True )
	username = models.CharField(max_length=255 , null = True)

	class Meta:
		unique_together = ['title','username']

	def __str__(self):
		return self.title

class CommentUpvote(models.Model):
	comment = models.ForeignKey(Comments, on_delete=models.CASCADE, related_name='upvotes')
	username = models.CharField(max_length=255 , null = True)

	class Meta:
		unique_together = ['comment','username']

	def __str__(self):
		return self.comment.post.title + '-' + self.comment.comment_author + '-' + self.username
