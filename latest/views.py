from django.shortcuts import render
from django.views.generic import ListView
from .models import Latestpost

# Create your views here.

class LatestPostsList(ListView) :
    model = Latestpost
    context_object_name = 'latest-posts'
    template_name = 'latest/index.html'

class LatestPostsDetail(DetailView) :
    model = Latestpost
    context_object_name = 'latest-posts-detail'
    template_name = 'latest/index.html'    


class EventDetailView(DetailView):
	model = Events
	context_object_name = 'event_detail'
	template_name = 'event/event_detail.html'
