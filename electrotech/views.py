from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import Events 
from event.views import EventView 

# Create your views here.

def index(request):
	return render(request,'electrotech/index.html')


class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.electrotech)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = Events.objects.filter(club=Events.electrotech)
		return context