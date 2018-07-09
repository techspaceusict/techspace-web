from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login ,logout
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.exceptions import ValidationError, PermissionDenied
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils import timezone

from django.views.generic import DetailView
from django.views.generic.edit import DeleteView

from .forms import UserForm, UserProfileForm, BlogAddForm, InfoAddForm, TeamAddForm, EventAddForm
from home.models import Contact, Info, Team
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
				return HttpResponse("Account is not active")
		else:
			print("someone tried to login with wrong credentials")

			return HttpResponse("invalid credentials")
	else:
		return render(request, 'registration/login.html', {})


@login_required
def user_logout(request):
	logout(request)
	return HttpResponseRedirect(reverse('home:index'))



@login_required
def dashboard(request):
	userprofile = UserProfile.objects.get(user=request.user)
	return render(request, 'log/dashboard.html', {'userprofile': userprofile})



@login_required
def messages(request):
	user = UserProfile.objects.get(user=request.user)
	contacts = Contact.objects.filter(app_name=user.club)
	return render(request, 'log/contact_dashboard.html', {'contacts': contacts})


@login_required
def info(request):
	user = UserProfile.objects.get(user=request.user)
	info = Info.objects.filter(club=user.club)
	return render(request, 'log/info_dashboard.html', {'info': info})


class InfoDetailView(LoginRequiredMixin, DetailView):
	model = Info
	template_name = 'log/infodetail_dashboard.html'
	context_object_name = 'info_detail'


@login_required
def events(request):
	user = UserProfile.objects.get(user=request.user)
	events = Events.objects.filter(club=user.club)
	return render(request, 'log/event_dashboard.html', {'events': events})


class EventDetailView(LoginRequiredMixin, DetailView):
	model = Events
	template_name = 'log/eventdetail_dashboard.html'
	context_object_name = 'event_detail'


@login_required
def team(request):
	user = UserProfile.objects.get(user=request.user)
	team = Team.objects.filter(club=user.club)
	return render(request, 'log/team_dashboard.html', {'team': team})

class TeamDetailView(LoginRequiredMixin, DetailView):
	model = Team
	template_name = 'log/teamdetail_dashboard.html'
	context_object_name = 'team_detail'


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

@login_required
def event_new(request):
	if request.method == 'POST':
		form = EventAddForm(request.POST)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			event = form.save(commit=False)
			event.club = user.club
			event.author = str(user)
			event.save()
			return redirect('log:event-detail', slug=event.slug)

	form = EventAddForm()
	return render(request, 'log/eventadd_form.html', {'form': form})


@login_required
def event_edit(request, slug):
	user = UserProfile.objects.get(user=request.user)
	event = get_object_or_404(Events, slug=slug)
	if user.club == event.club:
		if request.method == 'POST':
			form = EventAddForm(request.POST, instance=event)
			if form.is_valid():
				event = form.save(commit=False)
				event.club = user.club
				event.save()
				return redirect('log:event-detail', slug=event.slug)

		form = EventAddForm(instance=event)
		return render(request, 'log/eventedit_form.html', {'form': form})

	else:
		return redirect('home:index')


class EventDelete(LoginRequiredMixin, DeleteView):
	model = Events
	success_url = reverse_lazy('log:events')
	def get_object(self, queryset=None):
		event = super(EventDelete,self).get_object()
		user = UserProfile.objects.get(user=self.request.user)
		if event.club == user.club:
			return event
		raise Http404



@login_required
def post_new(request):
	if request.method == "POST":
		form = BlogAddForm(request.POST, request.FILES)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			post = form.save(commit=False)
			post.author = user.user.username
			post.club = user.club

			if 'image' in request.FILES:
				post.image = request.FILES['image']

			post.save()
			return redirect('blog:detail', slug=post.slug)


	form = BlogAddForm()
	return render(request, 'log/blogadd_form.html', {'form':form})


@login_required
def post_edit(request, slug):
	user = UserProfile.objects.get(user=request.user)
	post = get_object_or_404(BlogPost, slug=slug)
	if user.club == post.club:
		if request.method == "POST":
			form = BlogAddForm(request.POST, request.FILES ,instance=post)

			if form.is_valid():
				post = form.save(commit=False)
				post.author = str(user)
				post.club = str(user.club)
				post.date = timezone.now()

				if 'image' in request.FILES:
					post.image = request.FILES['image']

				post.save()
				return redirect('log:blog-detail', slug=post.slug)

		form = BlogAddForm(instance=post)
		return render(request, 'log/blogedit_form.html', {'form': form})

	else:
		return redirect('home:index')


class BlogDelete(LoginRequiredMixin, DeleteView):
	model = BlogPost
	success_url = reverse_lazy('log:blogs')

	def get_object(self, queryset=None):
		blog = super(BlogDelete,self).get_object()
		user = UserProfile.objects.get(user=self.request.user)
		if blog.club == user.club:
			return blog
		raise Http404


@login_required
def info_new(request):
	if request.method == "POST":
		form = InfoAddForm(request.POST)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			info = form.save(commit=False)
			info.author = str(user)
			info.club = user.club
			info.save()
			return redirect('log:info-detail', pk=info.pk)

	form = InfoAddForm()
	return render(request, 'log/infoadd_form.html', {'form': form})


@login_required
def info_edit(request, pk):
	user = UserProfile.objects.get(user=request.user)
	info = get_object_or_404(Info, pk=pk)
	if info.club == user.club:
		if request.method == 'POST':
			form = InfoAddForm(request.POST, instance=info)

			if form.is_valid():
				info = form.save(commit=False)
				info.author = str(user)
				info.club = user.club
				info.save()
				return redirect('log:info-detail', pk=info.pk)

		form = InfoAddForm(instance=info)
		return render(request, 'log/infoedit_form.html', {'form': form})

	else:
		return redirect('home:index')



class InfoDelete(LoginRequiredMixin, DeleteView):
	model = Info
	success_url = reverse_lazy('log:info')
	def get_object(self, queryset=None):
		info = super(InfoDelete,self).get_object()
		user = UserProfile.objects.get(user=self.request.user)
		if info.club == user.club:
			return blog
		raise Http404


@login_required
def team_new(request):
	if request.method == 'POST':
		form = TeamAddForm(request.POST)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			team = form.save(commit=False)
			team.club = user.club
			team.save()
			return redirect('log:team-detail', pk=info.pk)

	form = TeamAddForm()
	return render(request, 'log/teamadd_form.html', {'form': form})


@login_required
def team_edit(request, pk):
	user = UserProfile.objects.get(user=request.user)
	team = get_object_or_404(Team, pk=pk)
	if user.club == team.club:
		if request.method == 'POST':
			form = InfoAddForm(request.POST, instance=team)

			if form.is_valid():
				team = form.save(commit=False)
				team.club = user.club
				team.save()
				return redirect('log:team-detail', pk=team.pk)

		form = InfoAddForm(instance=team)
		return render(request, 'log/teamedit_form.html', {'form': form})

	else:
		return redirect('home:index')


class TeamDelete(LoginRequiredMixin, DeleteView):
	model = Team
	success_url = reverse_lazy('log:team')
	def get_object(self, queryset=None):
		team = super(TeamDelete,self).get_object()
		user = UserProfile.objects.get(user=self.request.user)
		if team.club == user.club:
			return team
		raise Http404
