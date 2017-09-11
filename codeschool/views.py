from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import Events 
from event.views import EventView 
from home.models import Info, Team

# Create your views here.

def index(request):
	info = Info.objects.filter(club=Info.codeschool)
	team = Team.objects.filter(club=Team.codeschool)
	return render(request,'codeschool/index.html', {'info':info, 'team': team})

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



