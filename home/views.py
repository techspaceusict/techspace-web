from django.shortcuts import render,HttpResponse
from django.contrib.auth.decorators import login_required

from .models import Club#, Contact, Association
from blog.models import BlogPost

from log.models import UserProfile
from django.contrib.auth.models import User

from event.models import AddEvent

# Create your views here.

def index(request):
	blogs = BlogPost.objects.order_by('-date')[:5]
	events = AddEvent.objects.order_by('-date')[:2]
		#clubs
	club_objects = Club.objects.all()
	app_urls = ['codeschool:index','cogitans:index','droidclub:index','ecell:index','electrotech:index','oslc:index','renderedusict:index','turingai:index']
	clubs = zip(club_objects,app_urls)
	#associations
	# assocs = Association.objects.all()
	return render(request, 'home/index.html', {'clubs':clubs, 'blogs':blogs, 'events':events })

def achievements(request):
	return render(request, 'home/achievements.html')

#
# def contactSubmit(request):
# 	if request.method == 'POST':
# 		name = request.POST['name']
# 		email = request.POST['email']
# 		content = request.POST['content']
# 		app_name = request.POST['app_name']
#
# 		Contact.objects.create(
# 			name = name,
# 			app_name = app_name,
# 			email = email,
# 			content = content
# 			)
# 	return HttpResponse('')
