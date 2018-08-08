from django import forms
from django.contrib.auth.models import User
from .models import UserProfile, Report

# from home.models import Info, Team
from event.models import Events


class UserForm(forms.ModelForm):
	password = forms.CharField(widget=forms.PasswordInput())

	class Meta():
		model = User
		fields = ['username', 'email','password',]# 'institution', 'course', 'year_of_graduation',]
		widgets = { 'username': forms.TextInput(attrs={'placeholder': 'Username'}),
					'email': forms.TextInput(attrs={'placeholder': 'E-mail', 'class': 'form-control' }),
					'password': forms.PasswordInput(attrs={'placeholder': 'Password', 'class': 'form-control' }),
					# 'institution': forms.TextInput(attrs={'placeholder': 'Institute', 'class': 'form-control' }),
					# 'course': forms.TextInput(attrs={'placeholder': 'Course', 'class': 'form-control' }),
					# # 'year_of_graduation': forms.TextInput(attrs={'placeholder': 'Year of graduation', 'class': 'form-control' }),




		}


class UserProfileForm(forms.ModelForm):

	class Meta():
		model = UserProfile
		fields = ['institution', 'course', 'year_of_graduation',]# 'bio', 'facebook', 'twitter', 'github', 'linkedIn', 'profile_pic',]
		widgets = {
					'institution': forms.TextInput(attrs={'placeholder': 'Institute', 'class': 'form-control' }),
					'course': forms.TextInput(attrs={'placeholder': 'Course', 'class': 'form-control' }),
					# # 'year_of_graduation': forms.TextInput(attrs={'placeholder': 'Year of graduation', 'class': 'form-control' }),




		}

class UserProfileEditForm(forms.ModelForm):
	class Meta():
		model = UserProfile
		fields = ['institution', 'course', 'year_of_graduation', 'bio', 'facebook', 'twitter', 'github', 'linkedIn', 'profile_pic', 'email',]
		widgets = {
					'institution': forms.TextInput(attrs={'placeholder': 'Institute', 'class': 'form-control' }),
					'course': forms.TextInput(attrs={'placeholder': 'Course', 'class': 'form-control' }),
					'bio': forms.TextInput(attrs={'placeholder': 'About yourself', 'class': 'form-control' }),
					'facebook': forms.TextInput(attrs={'placeholder': 'Facebook', 'class': 'form-control' }),
					'github': forms.TextInput(attrs={'placeholder': 'Github', 'class': 'form-control' }),
					'linkedIn': forms.TextInput(attrs={'placeholder': 'LinkedIn', 'class': 'form-control' }),
					'twitter': forms.TextInput(attrs={'placeholder': 'Twitter', 'class': 'form-control' }),
					'email': forms.TextInput(attrs={'placeholder': 'Email', 'class': 'form-control' }),

		}

class UserReportForm(forms.ModelForm):
	class Meta():
		model = Report
		fields = ['reason']
		widgets = { 'reason': forms.Textarea(attrs={'placeholder': 'If related to some post, provide respective link(s)'}) }

class EventAddForm(forms.ModelForm):

	class Meta:
		model = Events
		fields = ['title', 'date', 'time', 'image', 'venue', 'content']
		widgets = { 'title': forms.TextInput(attrs={'placeholder':'Title', 'class': 'form-title'}),
				'venue': forms.TextInput(attrs={'placeholder': 'Venue', 'class': 'form-control'}),
				'content': forms.Textarea(attrs={'placeholder': 'Enter the details about the event...'})


		}

# class InfoAddForm(forms.ModelForm):
#
# 	class Meta:
# 		model = Info
# 		fields = ['title', 'content']
# 		widgets = { 'title': forms.TextInput(attrs={'placeholder': 'type "information"'}),
# 				'content': forms.Textarea(attrs={'placeholder': 'Describe your club...'}),
#
# 		}
#
#
# class TeamAddForm(forms.ModelForm):
#
# 	class Meta:
# 		model = Team
# 		fields = ['name', 'image', 'designation', 'facebook', 'github', 'linkedin']
# 		widgets = { 'name': forms.TextInput(attrs={'placeholder': 'Name'}),
# 					'designation': forms.TextInput(attrs={'placeholder': 'Designation'}),
# 					'facebook': forms.TextInput(attrs={'placeholder': 'facebook'}),
# 					'github': forms.TextInput(attrs={'placeholder': 'github'}),
# 					'linkedin': forms.TextInput(attrs={'placeholder': 'linkedin'}),
#
#
#
#
# 		}
