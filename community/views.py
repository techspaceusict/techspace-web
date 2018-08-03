from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import ListView

from django.contrib.auth.decorators import login_required

from blog.views import BlogPost, Upvote
from event.views import Events

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

    blogs = BlogPost.objects.all()
    events = Events.objects.all()
    upvotes = Upvote.objects.all()

    for blog in blogs :
        blog.upvotes = len(Upvote.objects.filter( title = blog.title ))
        blog.state = len(Upvote.objects.filter(title = blog.title , username = request.user) )

    try:
    	#User is logged in 
    	user = UserProfile.objects.get(user=request.user)
    	return render(request, 'community/index.html', {'blogs':blogs, 'events':events, 'userprofile' : user })
    except:
    	return render(request, 'community/index.html', {'blogs':blogs, 'events':events})


@login_required
def toggleUpvote(request) :

    if (request.method == "POST") :
        
        blog_title = request.POST['title'] 
        blog_state = int(request.POST['state'])

        #print ("STate : " + blog_state)

        if (blog_state == 0) :
            Upvote.objects.create( username = request.user , title = blog_title )    
        else :
            Upvote.objects.get( username = request.user , title = blog_title ).delete()

    blogs = BlogPost.objects.all()
    events = Events.objects.all()
    upvotes = Upvote.objects.all()

    for blog in blogs :
        blog.upvotes = len(Upvote.objects.filter( title = blog.title ))
        blog.state = len(Upvote.objects.filter(title = blog.title , username = request.user) )

    return redirect( reverse('community:index') )         
        
    

