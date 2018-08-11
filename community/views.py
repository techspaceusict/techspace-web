from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.views.generic import ListView

from django.contrib.auth.decorators import login_required

from blog.models import BlogPost, Upvote
from event.models import Events
from latest.models import Latestpost

from log.models import UserProfile

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

    blogs = BlogPost.objects.filter(pinned = False)
    pinned_blogs = BlogPost.objects.filter(pinned = True)
    events = Events.objects.all()
    latest_posts = Latestpost.objects.all()
    upvotes = Upvote.objects.all()

    for blog in blogs :
        blog.upvotes = len(Upvote.objects.filter( title = blog.title ))
        blog.state = len(Upvote.objects.filter(title = blog.title , username = request.user))

    for blog in pinned_blogs:
        blog.upvotes = len(Upvote.objects.filter(title = blog.title))
        blog.state = len(Upvote.objects.filter(title = blog.title, username = request.user))

    return render(request, 'community/index.html', {'blogs':blogs, 'pinned_blogs':pinned_blogs, 'events':events , 'latest_posts' : latest_posts})


@login_required
def toggleUpvote(request) :

    if (request.method == "POST") :

        blog_title = request.POST['title']
        blog_state = int(request.POST['state'])
        onDetailPage = int(request.POST['onDetailPage'])
        blog = get_object_or_404(BlogPost, title = blog_title)

        #print ("STate : " + blog_state)

        if (blog_state == 0) :
            Upvote.objects.create( username = request.user , title = blog_title )
        else :
            Upvote.objects.get( username = request.user , title = blog_title ).delete()

        if onDetailPage:
            return redirect(reverse('blog:blog-detail', args=[blog.slug]))

    return redirect( reverse('community:index') )
