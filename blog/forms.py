from django import forms
from .models import BlogPost

class BlogPostForm(forms.ModelForm):

	class Meta:
		model = BlogPost
		fields = ('author', 'title', 'image', 'content','club')