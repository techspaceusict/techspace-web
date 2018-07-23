from django.conf.urls import url

from . import views


app_name = 'blog'

urlpatterns =[

	# url(r'^$', views.BlogListView.as_view(), name='blogs'),
	# url(r'^dashboard/blogs/$', views.blogs, name='blogs'),

	url(r'^add/$', views.post_new, name='blog-add'),
	url(r'^(?P<slug>[\w-]+)/edit$', views.post_edit , name='blog-edit'),
	url(r'^(?P<slug>[\w-]+)/delete$', views.BlogDelete.as_view() , name='blog-delete'),

	url(r'^(?P<slug>[\w-]+)/$', views.blogDetailView, name='blog-detail'),


]
