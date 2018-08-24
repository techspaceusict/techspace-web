from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import Events
from event.views import EventView
from latest.models import Latestpost

# from home.models import Info, Team

# Create your views here.

def index(request):
	# info = Info.objects.filter(club=Info.codeschool).order_by('id').last()
	# team = Team.objects.filter(club=Team.codeschool)
	event = Events.objects.filter(club=Events.codeschool).order_by('-date').first()
	latest_posts = Latestpost.objects.filter(club='codeschool').order_by('-date')
	return render(request,'clubs/codeschool/index2.html', {'event': event, 'latest_posts':latest_posts})

class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.codeschool)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = Events.objects.filter(club=Events.codeschool)
		return context
