from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import Event
from event.views import EventView
# from home.models import Info, Team

# Create your views here.

def index(request):
	# info = Info.objects.filter(club=Info.oslc).order_by('id').last()
	# team = Team.objects.filter(club=Team.oslc)
	event = Event.objects.filter(club=Event.oslc).order_by('-date').first()
	return render(request,'clubs/oslc/index.html', {'event': event})


class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.oslc)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = Event.objects.filter(club=Event.oslc)
		return context
