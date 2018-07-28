from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, DetailView
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse, reverse_lazy
from .models import BlogPost, Upvote, Tag
from .forms import CommentForm
from log.models import UserProfile
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils import timezone


from django.views.generic import DetailView
from django.views.generic.edit import DeleteView

from .forms import BlogAddForm
# Create your views here.

class BlogListView(ListView):
	model = BlogPost
	template_name = 'post/post_list.html'
	context_object_name = 'blogs'
#
# class BlogDetailView(DetailView):
# 	model = BlogPost
# 	template_name = 'blog/blog_detail.html'
# 	context_object_name = 'blog_detail'

def postDetailView(request, slug):
	# print("sulg = ", slug)
	user = UserProfile.objects.get(user=request.user)

	blog = get_object_or_404(BlogPost, slug=slug)
	comments = blog.comments.filter(active=True)
	if request.method == 'POST':
		comment_form = CommentForm(data=request.POST)
		if comment_form.is_valid():
			new_comment = comment_form.save(commit=False)
			new_comment.comment_author = request.user.username
			new_comment.post = blog
			new_comment.save()
			return redirect('blog:post-detail', slug=slug)
	else:
		comment_form = CommentForm()
	return render(request, 'post/post_detail_single.html', {'blog_detail': blog, 'form': comment_form, 'comments': comments, 'userprofile' : user})



@login_required
def post_new(request):
	user = UserProfile.objects.get(user=request.user)

	if request.method == "POST":
		form = BlogAddForm(request.POST, request.FILES)
		user = UserProfile.objects.get(user=request.user)
		if form.is_valid():
			post = form.save(commit=False)
			post.author = user.user.username
			post.club = user.club

			if 'image' in request.FILES:
				post.image = request.FILES['image']

			post.save()
			return HttpResponseRedirect(reverse('community:index'))


	form = BlogAddForm()
	return render(request, 'post/post_add_form.html', {'form':form, 'userprofile' : user})


@login_required
def post_edit(request, slug):
	user = UserProfile.objects.get(user=request.user)
	post = get_object_or_404(BlogPost, slug=slug)
	if request.user.username == post.author:
		if request.method == "POST":
			form = BlogAddForm(request.POST, request.FILES ,instance=post)

			if form.is_valid():
				post = form.save(commit=False)
				post.author = str(user)
				post.club = str(user.club)
				post.date = timezone.now()

				if 'image' in request.FILES:
					post.image = request.FILES['image']

				post.save()
				return redirect('blog:post-detail', slug=post.slug)

		form = BlogAddForm(instance=post)
		return render(request, 'post/post_edit_form.html', {'form': form, 'userprofile' : user})
	else:
		return redirect('home:index')

def blogDetailView(request, slug):
	# print("sulg = ", slug)
	user = UserProfile.objects.get(user=request.user)

	blog = get_object_or_404(BlogPost, slug=slug)
	comments = blog.comments.filter(active=True)
	if request.method == 'POST':
		comment_form = CommentForm(data=request.POST)
		if comment_form.is_valid():
			new_comment = comment_form.save(commit=False)
			new_comment.comment_author = request.user.username
			new_comment.post = blog
			new_comment.save()
			return redirect('blog:post-detail', slug=slug)
	else:
		comment_form = CommentForm()
	return render(request, 'post/blog_detail_single.html', {'blog_detail': blog, 'form': comment_form, 'comments': comments, 'userprofile' : user})



@login_required
def blog_new(request):
	user = UserProfile.objects.get(user=request.user)

	if request.method == "POST":
		form = BlogAddForm(request.POST, request.FILES)
		user = UserProfile.objects.get(user=request.user)
		print("invalid form")
		if form.is_valid():
			post = form.save(commit=False)
			post.author = user.user.username
			post.club = user.club


			if 'image' in request.FILES:
				post.image = request.FILES['image']

			post.save()
			blog = BlogPost.objects.get(title = post.title)
			for tag in form.cleaned_data['tags']:
				t = Tag.objects.get(word = tag)
				blog.tags.add(t)
			return HttpResponseRedirect(reverse('community:index'))


	form = BlogAddForm()
	return render(request, 'post/blog_add_form.html', {'form':form, 'userprofile' : user})



@login_required
def blog_edit(request, slug):
	user = UserProfile.objects.get(user=request.user)
	post = get_object_or_404(BlogPost, slug=slug)
	if request.user.username == post.author:
		if request.method == "POST":
			form = BlogAddForm(request.POST, request.FILES ,instance=post)

			if form.is_valid():
				post = form.save(commit=False)
				post.author = str(user)
				post.club = str(user.club)
				post.date = timezone.now()

				if 'image' in request.FILES:
					post.image = request.FILES['image']

				post.save()
				return redirect('blog:post-detail', slug=post.slug)

		form = BlogAddForm(instance=post)
		return render(request, 'post/blog_edit_form.html', {'form': form, 'userprofile' : user})

	else:
		return redirect('home:index')


class BlogDelete(LoginRequiredMixin, DeleteView):
	model = BlogPost
	success_url = reverse_lazy('community:index')

	def get_object(self, queryset=None):
		blog = super(BlogDelete,self).get_object()
		user = UserProfile.objects.get(user=self.request.user)
		if blog.club == user.club:
			return blog
		raise Http404
