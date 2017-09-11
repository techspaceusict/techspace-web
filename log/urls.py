from django.conf.urls import url

from .views import register, user_login, user_logout, dashboard, messages, blogs, events, post_new, BlogDetailView,post_edit, BlogDelete


app_name = 'log'

urlpatterns = [
	# url(r'^login/$', login, name='login'),
	# url(r'^logout/$', logout, name='logout'),
	url(r'^register/$', register, name='register'),
	url(r'^login/$', user_login, name='login'),
	url(r'^logout/$', user_logout, name='logout'),
	url(r'^dashboard/$', dashboard, name='dashboard'),
	url(r'^dashboard/messages/$', messages, name='messages'),
	url(r'^dashboard/blogs/$', blogs, name='blogs'),

	url(r'^dashboard/blogs/(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='blog-detail'),

	url(r'^dashboard/events/$', events, name='events'),
	url(r'^dashboard/blogs/add/$', post_new, name='blog-add'),
	url(r'^dashboard/blogs/(?P<pk>[0-9]+)/edit$', post_edit , name='blog-edit'),
	url(r'^dashboard/blogs/(?P<pk>[0-9]+)/delete$', BlogDelete.as_view() , name='blog-delete'),




	# url(r'^dashboard/$',),
	
]