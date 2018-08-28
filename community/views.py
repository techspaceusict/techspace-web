from django.shortcuts import render, redirect, get_object_or_404, HttpResponse
from django.urls import reverse
from django.http import JsonResponse
from django.views.generic import ListView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

from blog.models import BlogPost, Upvote
from event.models import Event
from latest.models import Latestpost

from log.models import UserProfile, Notification

from itertools import chain
# # Create your views here.
# class BlogListView(ListView):
#     model = BlogPost
#     template_name = 'community/index.html'
#     context_object_name = 'blogs'
#
# class EventListView(ListView):
#     model = Event
#     template_name = 'community/index.html'
#     context_object_name = 'events'

def contentForCommunity(request):

    all_blogs = BlogPost.objects.filter(pinned = False)
    pinned_blogs = BlogPost.objects.filter(pinned = True)
    events = Event.objects.all()
    latest_posts = Latestpost.objects.all()
    upvotes = Upvote.objects.all()

    page = request.GET.get('page', 1)
    paginator = Paginator(all_blogs, 10)

    try:
        blogs = paginator.page(page)
    except PageNotAnInteger:
        blogs = paginator.page(1)
    except EmptyPage:
        blogs = paginator.page(paginator.num_pages)


    for blog in blogs :
        blog.upvotes = len(Upvote.objects.filter( title = blog.title ))
        blog.state = len(Upvote.objects.filter(title = blog.title , username = request.user))
        blog.no_of_comments = len(blog.comments.all())

    for blog in pinned_blogs:
        blog.upvotes = len(Upvote.objects.filter(title = blog.title))
        blog.state = len(Upvote.objects.filter(title = blog.title, username = request.user))
        blog.no_of_comments = len(blog.comments.all())

    return render(request, 'community/index.html', {'blogs':blogs, 'pinned_blogs':pinned_blogs, 'events':events , 'latest_posts' : latest_posts})

def toggleUpvote(request) :

    if (request.method == "POST") :
        if(not request.user.is_authenticated):
            return JsonResponse({ 'user': 'none' });

        blog_id = request.POST['id']
        blog_state = int(request.POST['state'])
        blog = get_object_or_404(BlogPost, id = blog_id)

        if (blog_state == 0) :
            Upvote.objects.create( username = request.user , title = blog.title )

            if blog.author != request.user.username:
                notification = Notification.objects.create(
                    user = UserProfile.objects.get(user__username=blog.author),
                    type = Notification.like_notification,
                    post = blog,
                )
                notification.save()

        else :
            Upvote.objects.get( username = request.user , title = blog.title ).delete()

            if blog.author != request.user.username:
                try:
                    Notification.objects.get(
                        user = UserProfile.objects.get(user__username=blog.author),
                        type = Notification.like_notification,
                        post = blog,
                    ).delete()
                except:
                    print('no_notification')

        upvotes = len(Upvote.objects.filter(title = blog.title))
        data = {'state': not blog_state, 'upvotes': upvotes}
    return JsonResponse(data)
