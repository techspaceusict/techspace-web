from django.shortcuts import render
from django.views.generic import ListView

from blog.views import BlogPost
from event.views import Events

# # Create your views here.
# class BlogListView(ListView):
#     model = BlogPost
#     template_name = 'community/index.html'
#     context_object_name = 'blogs'
#
# class EventListView(ListView):
#     model = Events
#     template_name = 'community/index.html'
#     context_object_name = 'events'

def contentForCommunity(request):
    blogs = BlogPost.objects.all()
    events = Events.objects.all()
    return render(request, 'community/index.html', {'blogs':blogs, 'events':events})
