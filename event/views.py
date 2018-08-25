from django.shortcuts import render
from django.views.generic import ListView, DetailView

from .models import AddEvent
from log.models import UserProfile

# Create your views here.
class EventView(ListView):
	model = AddEvent
	context_object_name = 'events'
	template_name = 'event/index.html'


class EventDetailView(DetailView):
	model = AddEvent
	context_object_name = 'event_detail'
	template_name = 'event/event_detail.html'
