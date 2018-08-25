from django.shortcuts import render

from blog.models import BlogPost
from blog.views import BlogListView
from event.models import AddEvent
from event.views import EventView
# from home.models import Info, Team

# Create your views here.

def index(request):
	# info = Info.objects.filter(club=Info.ecell).order_by('id').last()
	# team = Team.objects.filter(club=Team.ecell)
	event = AddEvent.objects.filter(club=AddEvent.ecell).order_by('-date').first()
	return render(request,'clubs/ecell/index.html', {'event': event})


class BlogPostView(BlogListView):

	def get_context_data(self,**kwargs):
		context = super(BlogPostView,self).get_context_data(**kwargs)
		context['club_blogs'] = BlogPost.objects.filter(club=BlogPost.ecell)
		return context


class EventListView(EventView):

	def get_context_data(self,**kwargs):
		context = super(EventListView,self).get_context_data(**kwargs)
		context['club_events'] = AddEvent.objects.filter(club=AddEvent.ecell)
		return context
