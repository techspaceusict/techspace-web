try:
	import urllib2
except:
	import urllib.request as urllib2
import urllib
import json

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login ,logout
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.exceptions import ValidationError, PermissionDenied
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils import timezone
from django.conf import settings
from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.core.mail import EmailMessage

from datetime import datetime


from django.views.generic import DetailView
from django.views.generic.edit import DeleteView, UpdateView

from .forms import UserForm, UserProfileForm, UserProfileEditForm, UserReportForm, MessageForm#, EventAddForm#, InfoAddForm, TeamAddForm
# from home.models import Contact, Info, Team

# from event.models import Event
from .models import UserProfile, Report, Message, Notification
from blog.models import BlogPost, Comments, Upvote

from .tokens import account_activation_token




# Create your views here.

def register(request):
	registered = False
	if request.user.is_authenticated:
			return HttpResponseRedirect(reverse('community:index'))
	elif request.method == 'POST':
		user_form = UserForm(data=request.POST)
		profile_form = UserProfileForm(data=request.POST)

		if user_form.is_valid() and profile_form.is_valid() :

			''' Begin reCAPTCHA validation '''
			recaptcha_response = request.POST.get('g-recaptcha-response')
			url = 'https://www.google.com/recaptcha/api/siteverify'
			values = {
                'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
                'response': recaptcha_response
            }
			try:
				data = urllib.urlencode(values).encode()
			except:
				data = urllib.parse.urlencode(values).encode()
			req =  urllib2.Request(url, data=data)
			response = urllib2.urlopen(req)
			result = json.loads(response.read().decode())
			''' End reCAPTCHA validation '''
			if result['success']:
				user = user_form.save()
				user.set_password(user.password)
				user.save()

				profile = profile_form.save(commit=False)
				profile.user = user
				profile.save()
				# messages.info(request, 'Thanks for registering, You are now logged in.')
				new_user = authenticate(username=user_form.cleaned_data['username'],
										password=user_form.cleaned_data['password'],
										)
				login(request, new_user)
				registered = True

				return HttpResponseRedirect(reverse('community:index'))
			else:
				messages.error(request,'Invalid reCAPTCHA. Please try again.')
				return HttpResponseRedirect(reverse('register'))





		else:
			print(user_form.errors, profile_form.errors)
	else:
		user_form = UserForm()
		profile_form = UserProfileForm()
	return render(request, 'registration/user_register.html', {'registered':registered, 'user_form': user_form, 'profile_form': profile_form})

@login_required
def activate_email(request):
	user = request.user
	current_site = get_current_site(request)
	mail_subject = 'Activate your techspace account.'
	message = render_to_string('registration/email_activate.html', {
		'user': user,
		'domain': current_site.domain,
		'uid': urlsafe_base64_encode(force_bytes(user.pk)),
		'token': account_activation_token.make_token(user),
	})
	email_id = UserProfile.objects.get(user=request.user).email
	if not email_id:
		return render(request, 'global_components/message.html', {'title':'Add email', 'message':'Please specify your email address by editing your profile.'})
	to_email = email_id
	email = EmailMessage(mail_subject, message, to=[to_email])
	email.send()
	return HttpResponse('Please check your email inbox to complete the registration process')

@login_required
def activate(request, uidb64, token):
	try:
		uid = force_text(urlsafe_base64_decode(uidb64))
		user = User.objects.get(pk=uid)
		user_profile = UserProfile.objects.get(user=user)
	except:
		user_profile=None
	if user_profile is not None and account_activation_token.check_token(user, token):
		user_profile.email_activated = True
		user_profile.save()
		return HttpResponseRedirect(reverse('community:index'))
	else:
		return HttpResponse('Activation link is invalid!')

def user_login(request):
	if request.method == 'POST':
		username = request.POST.get("username")
		password = request.POST.get("password")

		user = authenticate(username=username, password=password)

		if user:
			if user.is_active:
				login(request, user)
				profile = UserProfile.objects.get(user=user)
				profile.last_login_time = datetime.now()
				profile.ip_address = request.META.get('REMOTE_ADDR')
				profile.user_agent = request.META.get('HTTP_USER_AGENT')
				profile.save()

				if 'next' in request.POST:
					return redirect(request.POST.get('next'))
				else:
					return HttpResponseRedirect(reverse('community:index'))
			else:
				messages.warning(request, "Account is inactive.")
				return HttpResponseRedirect(reverse("login"))
		else:
			print("someone tried to login with wrong credentials")
			messages.error(request, "Invalid username or password. Please try again")
			return HttpResponseRedirect(reverse("login"))
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

			notification = Notification.objects.create(
				user=message.receiver,
				type=Notification.message_notification,
			)

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
	try:
		profile = UserProfile.objects.get(user__username=name)
	except:
		raise Http404("User could not be found.")
	blogs = BlogPost.objects.filter(author=name, isblog = True)
	for blog in blogs:
		blog.upvotes = len(Upvote.objects.filter( title = blog.title ))
	try:
		userprofile = UserProfile.objects.get(user=request.user)
		return render(request, 'log/dashboard.html', {'blogs': blogs, 'profile': profile})
	except:
		return render(request, 'log/dashboard.html', {'profile': profile, 'blogs': blogs})



def portfolio(request, name=None):
	profile = UserProfile.objects.get(user__username=name)
	return render(request, 'log/portfolio.html', {'profile': profile})

def inbox(request, name=None):
	if request.user.username == name:
		user = UserProfile.objects.get(user=request.user)
		messages = user.received.all()
		sent_messages = user.sent.all()
		Notification.objects.filter(user=user, type=Notification.message_notification).delete()
		return render(request, 'log/inbox.html', {'messages': messages, 'sent_messages': sent_messages})

	return redirect('log:dashboard', name=name)

def discussions(request, name=None):
	profile = UserProfile.objects.get(user__username=name)
	posts = BlogPost.objects.filter(author=name, isblog = False)
	for post in posts:
		post.upvotes = len(Upvote.objects.filter( title = post.title ))
	return render(request, 'log/discussions.html', {'profile': profile, 'posts': posts})

def comments(request, name=None):
	profile = UserProfile.objects.get(user__username=name)
	comments = Comments.objects.filter(comment_author=profile.user.username)
	return render(request, 'log/comments.html', {'comments': comments, 'profile': profile})

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
