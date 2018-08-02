from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Latestpost

# Create your views here.

class LatestPostsListView(ListView) :
    model = Latestpost
    context_object_name = 'latest_posts'
    template_name = 'latest/index.html'

class LatestPostsDetailView(DetailView) :
    model = Latestpost
    context_object_name = 'latest_posts_detail'
    template_name = 'latest/latest_post_detail.html'    

