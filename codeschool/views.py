from django.shortcuts import render
from django.views.generic import ListView, DetailView

from blog.models import BlogPost
from .models import Info, Team

# Create your views here.

def index(request):
	info = Info.objects.all()
	team = Team.objects.all()
	return render(request,'codeschool/index.html', {'info':info, 'team': team})

class BlogPostView(ListView):
	model = BlogPost
	context_object_name = 'blog_post'
	template_name = 'blog/index.html'

class BlogDetailView(DetailView):
	context_object_name = 'blog_detail'
	model = BlogPost
	template_name = 'blog/blog_detail.html'
