from django import forms
from .models import BlogPost, Comments, Tag


class CommentForm(forms.ModelForm):
	class Meta:
		model = Comments
		fields = ['comment_text']
		widgets = {'comment_text' : forms.TextInput(attrs={'placeholder': 'What are your thoughts...', 'autocomplete': 'off', 'oninput': 'get_suggestions(this.value)', 'class': 'form-control'})}

class BlogAddForm(forms.ModelForm):

	tags = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple(), queryset=Tag.objects.all(), required=False)

	image = forms.ImageField(required=False)
	class Meta:
		model = BlogPost

		fields = ['title','description', 'image' , 'content', 'tags']
		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'Keep it short and simple.', 'class': 'form-control'}),
					'description': forms.TextInput(attrs={'placeholder': 'Write a short description...', 'class': 'form-control', 'label':'fghj' }),
                    'image': forms.FileInput(attrs={'class':'form-control', 'label':'Preview Image'}),
		}

class PostAddForm(forms.ModelForm):

	tags = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple(), queryset=Tag.objects.all(), required=False)

	image = forms.ImageField(required=False)
	class Meta:
		model = BlogPost


		fields = ['title','image' , 'content', 'tags']
		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'Keep it short and simple.', 'class': 'form-control'}),
					#'content': forms.Textarea(attrs={'placeholder': 'Write your thoughts...', 'class': 'form-control' }),

		}
