from django.shortcuts import render
from django.views.generic import ListView, DetailView

from .models import Events

# Create your views here.
class EventView(ListView):
	model = Events
	context_object_name = 'events'
	template_name = 'event/index.html'

class EventDetailView(DetailView):
	model = Events
	context_object_name = 'event_detail'
	template_name = 'event/event_detail.html'