from django import forms
from .models import BlogPost, Comments


class CommentForm(forms.ModelForm):
	class Meta:
		model = Comments
		fields = ['comment_text']
		widgets = {'comment_text' : forms.TextInput(attrs={'placeholder': 'What are your thoughts...'})}

class BlogAddForm(forms.ModelForm):
	image = forms.ImageField(required=False)

	class Meta:
		model = BlogPost
		fields = ['title','image' , 'content']
		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'Title', 'class': 'form-control'}),
					'content': forms.Textarea(attrs={'placeholder': 'Write your thoughts...', 'class': 'form-control' }),

		}
