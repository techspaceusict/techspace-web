from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import Event
from event.views import EventView
# from home.models import Info, Team

# Create your views here.

def index(request):
	# info = Info.objects.filter(club=Info.renderedusict).order_by('id').last()
	# team = Team.objects.filter(club=Team.renderedusict)
	event = Events.objects.filter(club=Event.renderedusict).order_by('-date').first()
	return render(request,'clubs/renderedusict/index.html', {'event': event})


class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.renderedusict)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = Event.objects.filter(club=Event.renderedusict)
		return context
