from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login ,logout
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.exceptions import ValidationError
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils import timezone

from django.views.generic import DetailView
from django.views.generic.edit import DeleteView

from .forms import UserForm, UserProfileForm, BlogAddForm
from home.models import Contact
from blog.models import BlogPost
from event.models import Events
from .models import UserProfile

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
	user = UserProfile.objects.get(user=request.user)
	
	contacts = Contact.objects.filter(app_name=user.club)

	return render(request, 'log/contact_dashboard.html', {'contacts': contacts})


@login_required
def blogs(request):
	user = UserProfile.objects.get(user=request.user)

	if user.club == 'techspace':
		blogs = BlogPost.objects.all()

	else:
		blogs = BlogPost.objects.filter(club=user.club)

	return render(request, 'log/blog_dashboard.html', {'blogs': blogs})


class BlogDetailView(LoginRequiredMixin, DetailView):
	model = BlogPost
	template_name = 'log/blogdetail_dashboard.html'
	context_object_name = 'blog_detail'
	

@login_required
def events(request):
	user = UserProfile.objects.get(user=request.user)

	if user.club == 'techspace':
		events = Events.objects.all()

	else:
		events = Events.objects.filter(club=user.club)

	return render(request, 'log/event_dashboard.html', {'events': events})



# class BlogCreate(CreateView):
# 	model = BlogPost
# 	fields = ['author', 'title', 'image', 'content', 'club']

# 	def get_club(request):
# 		user = UserProfile.objects.get(user=request.user)
# 		return user.club

# 	def get_initial(self):
# 		return {'author': self.request.user.username}

@login_required
def post_new(request):
	if request.method == "POST":
		form = BlogAddForm(request.POST)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			post = form.save(commit=False)
			post.author = user
			post.club = user.club
			post.save()
			return redirect('log:blog-detail', pk=post.pk)

	else:
		form = BlogAddForm()

	return render(request, 'log/blogadd_form.html', {'form':form})

@login_required
def post_edit(request, pk):
	post = get_object_or_404(BlogPost, pk=pk)
	if request.method == "POST":
		form = BlogAddForm(request.POST, instance=post)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			post = form.save(commit=False)
			post.author = str(user)
			post.club = str(user.club)
			post.date = timezone.now()
			post.save()
			return redirect('log:blog-detail', pk=post.pk)
	else:
		form = BlogAddForm(instance=post)
	return render(request, 'log/blogedit_form.html', {'form': form})


class BlogDelete(LoginRequiredMixin ,DeleteView):
	model = BlogPost
	success_url = reverse_lazy('log:blogs')



















