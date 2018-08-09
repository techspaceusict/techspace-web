from django.shortcuts import render
from django.views.generic import ListView, DetailView

from .models import Events
from log.models import UserProfile

# Create your views here.
class EventView(ListView):
	model = Events
	context_object_name = 'events'
	template_name = 'event/index.html'

	def get_context_data(self, *args, **kwargs):
		context = super(EventView, self).get_context_data(*args, **kwargs)
		context['userprofile'] = UserProfile.objects.get(user=self.request.user)
		return context


class EventDetailView(DetailView):
	model = Events
	context_object_name = 'event_detail'
	template_name = 'event/event_detail.html'

	def get_context_data(self, *args, **kwargs):
		context = super(EventDetailView, self).get_context_data(*args, **kwargs)
		context['userprofile'] = UserProfile.objects.get(user=self.request.user)
		return context
