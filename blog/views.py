from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import BlogPost
# Create your views here.

#def index(request):
#	posts = BlogPost.objects.all()
#	return render(request, 'blog/index.html',{"posts":posts})

class BlogListView(ListView):
	context_object_name = 'posts'
	model = BlogPost
	template_name = 'blog/index.html'


class BlogDetailView(DetailView):
	context_object_name = 'blog_detail'
	model = BlogPost
	template_name = 'blog/blog_detail.html'
