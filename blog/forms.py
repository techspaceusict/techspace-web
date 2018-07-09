from django import forms
from .models import BlogPost, Comments

class BlogPostForm(forms.ModelForm):

	class Meta:
		model = BlogPost
		fields = ('author', 'title', 'image', 'content','club')

class CommentForm(forms.ModelForm):
	class Meta:
		model = Comments
		fields = ['comment_text']
		widgets = {'comment_text' : forms.TextInput(attrs={'placeholder': 'What are your thoughts...'})}
