from django.conf.urls import url

from . import views


app_name = 'blog'

urlpatterns =[

	# url(r'^$', views.BlogListView.as_view(), name='blogs'),
	# url(r'^dashboard/blogs/$', views.blogs, name='blogs'),

	url(r'^add/$', views.post_new, name='post-add'),
	url(r'^(?P<slug>[\w-]+)/edit$', views.post_edit , name='post-edit'),
	url(r'^(?P<slug>[\w-]+)/$', views.postDetailView, name='post-detail'),

	url(r'^blog/add/$', views.blog_new, name='blog-add'),
	url(r'^blog/(?P<slug>[\w-]+)/edit$', views.blog_edit , name='blog-edit'),
	url(r'^blog/(?P<slug>[\w-]+)/$', views.blogDetailView, name='blog-detail'),

	url(r'^(?P<slug>[\w-]+)/delete$', views.BlogDelete.as_view() , name='blog-delete'),
	url(r'^togglecommentupvote', views.toggleCommentUpvote, name='toggle-comment-upvote'),
	url(r'^reply_comment', views.replyComment, name='reply-comment'),
	url(r'^mention_suggestion', views.mentionSuggestion, name='mention_suggestion'),


]
