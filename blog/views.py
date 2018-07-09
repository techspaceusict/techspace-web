from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, DetailView
from django.http import HttpResponseRedirect
from .models import BlogPost
from .forms import CommentForm
from log.models import UserProfile
# Create your views here.

class BlogListView(ListView):
	model = BlogPost
	template_name = 'blog/index.html'
	context_object_name = 'blogs'


#
# class BlogDetailView(DetailView):
# 	model = BlogPost
# 	template_name = 'blog/blog_detail.html'
# 	context_object_name = 'blog_detail'

def blogDetailView(request, slug):
	# print("sulg = ", slug)
	blog = get_object_or_404(BlogPost, slug=slug)
	comments = blog.comments.filter(active=True)
	if request.method == 'POST':
		comment_form = CommentForm(data=request.POST)
		if comment_form.is_valid():
			new_comment = comment_form.save(commit=False)
			new_comment.comment_author = request.user.username
			new_comment.post = blog
			new_comment.save()
			return redirect('blog:detail', slug=slug)
	else:
		comment_form = CommentForm()
	return render(request, 'blog/blog_detail.html', {'blog_detail': blog, 'form': comment_form, 'comments': comments})
