from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login ,logout
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.exceptions import ValidationError, PermissionDenied
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils import timezone

from django.views.generic import DetailView
from django.views.generic.edit import DeleteView, UpdateView

from .forms import UserForm, UserProfileForm, UserProfileEditForm, UserReportForm, MessageForm, EventAddForm#, InfoAddForm, TeamAddForm
# from home.models import Contact, Info, Team

from event.models import Events
from .models import UserProfile, Report, Message
from blog.models import BlogPost, Comments


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
			return HttpResponseRedirect(reverse('login'))
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

				if 'next' in request.POST:
					return redirect(request.POST.get('next'))
				else:
					return HttpResponseRedirect(reverse('community:index'))
			else:
				return HttpResponse("Account is not active")
		else:
			print("someone tried to login with wrong credentials")

			return HttpResponse("invalid credentials")
	else:
		if request.user.is_authenticated:
			return HttpResponseRedirect(reverse('community:index'))
		else:
			return render(request, 'registration/login.html', {})

@login_required
def user_logout(request):
	logout(request)
	return HttpResponseRedirect(reverse('home:index'))


@login_required
def userProfileEdit(request, name=None):
	user = UserProfile.objects.get(user=request.user)
	if request.method == "POST":
		form = UserProfileEditForm(request.POST, request.FILES, instance=user)
		if form.is_valid():
			user = form.save(commit=False)
			if 'profile_pic' in request.FILES:
				user.profile_pic = request.FILES['profile_pic']
			user.save()
			return redirect('log:dashboard', name=user.user.username)
	form = UserProfileEditForm(instance=user)
	return render(request, 'log/profile_edit_form.html', {'form':form, 'username': user.user.username})


@login_required
def sendMessage(request, name=None):
	user = UserProfile.objects.get(user=request.user)
	if request.method == "POST":
		form = MessageForm(request.POST)
		if form.is_valid():
			message = form.save(commit=False)
			message.sender = user
			message.receiver = UserProfile.objects.get(user__username=name)
			message.save()

			return redirect('log:dashboard', name=name)

	form = MessageForm()
	return render(request, 'log/message_form.html', {'form': form, 'username': name})


@login_required
def userReport(request, name=None):
	user = UserProfile.objects.get(user=request.user)
	if request.method == "POST":
		form = UserReportForm(request.POST)
		if form.is_valid():
			report = form.save(commit=False)
			report.reported_by = user
			reported_user = UserProfile.objects.get(user__username=name)
			report.reported_user = reported_user
			report.save()

			return redirect('log:dashboard', name=name)
	form = UserReportForm()
	return render(request, 'log/user_report_form.html', {'form': form, 'username': name})

def profile_view(request, username):
    u = User.objects.get(username=username)

def dashboard(request, name=None):
	profile = UserProfile.objects.get(user__username=name)
	blogs = BlogPost.objects.filter(author=name, isblog = True)
	try:
		userprofile = UserProfile.objects.get(user=request.user)
		return render(request, 'log/dashboard.html', {'blogs': blogs, 'profile': profile})
	except:
		return render(request, 'log/dashboard.html', {'profile': profile, 'blogs': blogs})



def portfolio(request, name=None):
	try:
		profile = UserProfile.objects.get(user__username=name)
		userprofile = UserProfile.objects.get(user=request.user)
		return render(request, 'log/portfolio.html', {'profile': profile})
	except:
		raise Http404

def inbox(request, name=None):
	if request.user.username == name:
		user = UserProfile.objects.get(user=request.user)
		new_messages = user.received.filter(read=False)
		for msg in new_messages:
			msg.read = True
			msg.save()
		messages = user.received.all()
		sent_messages = user.sent.all()
		return render(request, 'log/inbox.html', {'messages': messages, 'sent_messages': sent_messages})

	return redirect('log:dashboard', name=name)

def discussions(request, name=None):
	profile = UserProfile.objects.get(user__username=name)
	posts = BlogPost.objects.filter(author=name, isblog = False)
	try:
		userprofile = UserProfile.objects.get(user=request.user)
		return render(request, 'log/discussions.html', {'posts': posts, 'profile': profile})
	except:
		return render(request, 'log/discussions.html', {'profile': profile, 'posts': posts})

def comments(request, name=None):
	try:
		comments = Comments.objects.filter(comment_author=request.user)
		userprofile = UserProfile.objects.get(user=request.user)
		profile = UserProfile.objects.get(user__username=name)
		return render(request, 'log/comments.html', {'comments': comments, 'profile': profile})
	except:
		raise Http404


#
# @login_required
# def messages(request, name=None):
# 	user = UserProfile.objects.get(user=request.user)
# 	contacts = Contact.objects.filter(app_name=user.club)
# 	return render(request, 'log/contact_dashboard.html', {'contacts': contacts})
#
#
# @login_required
# def info(request, name=None):
# 	user = UserProfile.objects.get(user=request.user)
# 	info = Info.objects.filter(club=user.club)
# 	return render(request, 'log/info_dashboard.html', {'info': info})
#
#
# class InfoDetailView(LoginRequiredMixin, DetailView):
# 	model = Info
# 	template_name = 'log/infodetail_dashboard.html'
# 	context_object_name = 'info_detail'
#
#
# @login_required
# def team(request, name=None):
# 	user = UserProfile.objects.get(user=request.user)
# 	team = Team.objects.filter(club=user.club)
# 	return render(request, 'log/team_dashboard.html', {'team': team})
#
# class TeamDetailView(LoginRequiredMixin, DetailView):
# 	model = Team
# 	template_name = 'log/teamdetail_dashboard.html'
# 	context_object_name = 'team_detail'
#
#
#
#
# # class BlogCreate(CreateView):
# # 	model = BlogPost
# # 	fields = ['author', 'title', 'image', 'content', 'club']
#
#
# @login_required
# def info_new(request, name=None):
# 	if request.method == "POST":
# 		form = InfoAddForm(request.POST)
# 		user = UserProfile.objects.get(user=request.user)
# 		if form.is_valid():
# 			info = form.save(commit=False)
# 			info.author = str(user)
# 			info.club = user.club
# 			info.save()
# 			return redirect('log:info-detail', pk=info.pk, name=user.user.username)
#
# 	form = InfoAddForm()
# 	return render(request, 'log/infoadd_form.html', {'form': form})
#
#
# @login_required
# def info_edit(request, pk, name=None):
# 	user = UserProfile.objects.get(user=request.user)
# 	info = get_object_or_404(Info, pk=pk)
# 	if info.club == user.club:
# 		if request.method == 'POST':
# 			form = InfoAddForm(request.POST, instance=info)
#
# 			if form.is_valid():
# 				info = form.save(commit=False)
# 				info.author = str(user)
# 				info.club = user.club
# 				info.save()
# 				return redirect('log:info-detail', pk=info.pk, name=user.username)
#
# 		form = InfoAddForm(instance=info)
# 		return render(request, 'log/infoedit_form.html', {'form': form})
#
# 	else:
# 		return redirect('home:index')
#
#
#
# class InfoDelete(LoginRequiredMixin, DeleteView):
# 	model = Info
#
# 	def get_success_url(self):
# 		user = UserProfile.objects.get(user=self.request.user)
# 		return reverse('log:info', kwargs={'name': user.user})
#
# 	def get_object(self, queryset=None):
# 		info = super(InfoDelete,self).get_object()
# 		user = UserProfile.objects.get(user=self.request.user)
# 		if info.club == user.club:
# 			return info
# 		raise Http404
#
#
# @login_required
# def team_new(request, name=None):
# 	if request.method == 'POST':
# 		form = TeamAddForm(request.POST)
# 		user = UserProfile.objects.get(user=request.user)
# 		if form.is_valid():
# 			team = form.save(commit=False)
# 			team.club = user.club
# 			team.save()
# 			return redirect('log:team-detail', pk=info.pk, name=user.name)
#
# 	form = TeamAddForm()
# 	return render(request, 'log/teamadd_form.html', {'form': form})
#
#
# @login_required
# def team_edit(request, pk, name=None):
# 	user = UserProfile.objects.get(user=request.user)
# 	team = get_object_or_404(Team, pk=pk)
# 	if user.club == team.club:
# 		if request.method == 'POST':
# 			form = InfoAddForm(request.POST, instance=team)
#
# 			if form.is_valid():
# 				team = form.save(commit=False)
# 				team.club = user.club
# 				team.save()
# 				return redirect('log:team-detail', pk=team.pk, name=	user.username)
#
# 		form = InfoAddForm(instance=team)
# 		return render(request, 'log/teamedit_form.html', {'form': form})
#
# 	else:
# 		return redirect('home:index')
#
#
# class TeamDelete(LoginRequiredMixin, DeleteView):
# 	model = Team
#
# 	def get_success_url(self):
# 		user = UserProfile.objects.get(user=self.request.user)
# 		return reverse('log:blogs', kwargs={'name': user.user})
#
# 	def get_object(self, queryset=None):
# 		team = super(TeamDelete,self).get_object()
# 		user = UserProfile.objects.get(user=self.request.user)
# 		if team.club == user.club:
# 			return team
# 		raise Http404
