from django.shortcuts import render
from django.views.generic import ListView
from .models import Latestpost

# Create your views here.

class LatestPostsList(ListView) :
    model = Latestpost
    context_object_name = 'latest-posts'
    template_name = 'event/index.html'