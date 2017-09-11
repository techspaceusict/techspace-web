from django import forms
from django.contrib.auth.models import User
from .models import UserProfile

from blog.models import BlogPost


class UserForm(forms.ModelForm):
	password = forms.CharField(widget=forms.PasswordInput())

	class Meta():
		model = User
		fields = ['username', 'email','password']


class UserProfileForm(forms.ModelForm):

	class Meta():
		model = UserProfile
		fields = ['club']

class BlogAddForm(forms.ModelForm):

	class Meta:
		model = BlogPost
		fields = ['title', 'content']




