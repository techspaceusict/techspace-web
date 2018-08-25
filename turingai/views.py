from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import AddEvent
from event.views import EventView
# from home.models import Info, Team

# Create your views here.

def index(request):
	# info = Info.objects.filter(club=Info.turingai).order_by('id').last()
	# team = Team.objects.filter(club=Team.turingai)
	event = AddEvent.objects.filter(club=AddEvent.turingai).order_by('date').last()
	return render(request,'clubs/turingai/index.html', {'event': event})


class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.turingai)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = AddEvent.objects.filter(club=AddEvent.turingai)
		return context
