from django import forms
from .models import BlogPost, Comments, Tag


class CommentForm(forms.ModelForm):
	class Meta:
		model = Comments
		fields = ['comment_text']
		widgets = {'comment_text' : forms.Textarea(attrs={'placeholder': 'What are your thoughts...', 'autocomplete': 'off', 'oninput': 'get_suggestions(this.value)','class':'form-control','rows':'5'})}

class BlogAddForm(forms.ModelForm):

	tags = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple(), queryset=Tag.objects.all(), required=False)

	image = forms.ImageField(required=False)
	class Meta:
		model = BlogPost

		fields = ['title', 'content', 'description', 'image' ,  'tags']
		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'Keep it short and simple.', 'class': 'form-control'}),
					'image': forms.FileInput(attrs={'class':'form-control'}),
					'description': forms.Textarea(attrs={'placeholder': 'Write a short summary.', 'class': 'form-control','rows':'4'}),
                    
		}

	def __init__(self, *args, **kwargs):
		super(BlogAddForm, self).__init__(*args, **kwargs)
		self.fields['image'].label = 'Preview Image'
		self.fields['description'].label = 'Description'
		self.fields['content'].label = 'Your blog goes here:'

class PostAddForm(forms.ModelForm):

	tags = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple(), queryset=Tag.objects.all(), required=False)

	image = forms.ImageField(required=False)
	class Meta:
		model = BlogPost


		fields = ['title', 'content', 'image' , 'tags']
		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'Keep it short and simple.', 'class': 'form-control'}),
					#'content': forms.Textarea(attrs={'placeholder': 'Write your thoughts...', 'class': 'form-control' }),

		}

	def __init__(self, *args, **kwargs):
		super(PostAddForm, self).__init__(*args, **kwargs)
		self.fields['content'].label = ''
