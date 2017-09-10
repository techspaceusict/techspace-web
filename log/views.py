from django.shortcuts import render
from .forms import UserForm, UserProfileForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login ,logout
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.core.exceptions import ValidationError


from home.models import Contact

# Create your views here.

def register(request):
	registered = False

	if request.method == 'POST':
		user_form = UserForm(data=request.POST)
		profile_form = UserProfileForm(data=request.POST)

		if user_form.is_valid() and profile_form.is_valid() :
			user = user_form.save()
			user.set_password(user.password)
			user.save()

			profile = profile_form.save(commit=False)
			profile.user = user
			profile.save()


			registered = True
			return HttpResponseRedirect(reverse('log:login'))
		else:
			print(user_form.errors, profile_form.errors)
	else:
		user_form = UserForm()
		profile_form = UserProfileForm()
	return render(request, 'registration/user_register.html', {'registered':registered, 'user_form': user_form, 'profile_form': profile_form})


def user_login(request):
	if request.method == 'POST':
		username = request.POST.get("username")
		password = request.POST.get("password")

		user = authenticate(username=username, password=password)

		if user:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect(reverse('log:dashboard'))
			else:
				raise ValidationError('account not active')
		else:
			print("someone tried to login with wrong credentials")

			raise ValidationError("invalid credentials")
	else:
		return render(request, 'registration/login.html', {})


@login_required
def user_logout(request):
	logout(request)
	return HttpResponseRedirect(reverse('home:index'))



@login_required
def dashboard(request):
	return render(request, 'log/dashboard.html')

@login_required
def messages(request):
	
	contacts = Contact.objects.all()

	return render(request, 'log/contact_dashboard.html', {'contacts': contacts})