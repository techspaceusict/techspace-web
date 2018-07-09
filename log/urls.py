from django.conf.urls import url

from . import views

app_name = 'log'

urlpatterns = [
	# url(r'^login/$', login, name='login'),
	# url(r'^logout/$', logout, name='logout'),
	# url(r'^register/$', register, name='register'),
	# url(r'^login/$', user_login, name='login'),
	# url(r'^logout/$', user_logout, name='logout'),
	# url(r'^dashboard/$', dashboard, name='dashboard'),
	# url(r'^dashboard/messages/$', messages, name='messages'),
	# url(r'^dashboard/blogs/$', blogs, name='blogs'),

	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='blog-detail'),

	# url(r'^dashboard/events/$', events, name='events'),
	# url(r'^dashboard/blogs/add/$', post_new, name='blog-add'),
	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/edit$', post_edit , name='blog-edit'),
	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/delete$', BlogDelete.as_view() , name='blog-delete'),
	url(r'^register/$', views.register, name='register'),
	url(r'^login/$', views.user_login, name='login'),
	url(r'^logout/$', views.user_logout, name='logout'),
	url(r'^dashboard/$', views.dashboard, name='dashboard'),
	url(r'^dashboard/messages/$', views.messages, name='messages'),
	url(r'^dashboard/blogs/$', views.blogs, name='blogs'),
	url(r'^dashboard/info/$', views.info, name='info'),
	url(r'^dashboard/info/(?P<pk>[0-9]+)/$', views.InfoDetailView.as_view(), name='info-detail'),

	url(r'^dashboard/team/$', views.team, name='team'),
	url(r'^dashboard/team/(?P<pk>[0-9]+)/$', views.TeamDetailView.as_view(), name='team-detail'),

	url(r'^dashboard/events/$', views.events, name='events'),


	url(r'^dashboard/blogs/add/$', views.post_new, name='blog-add'),
	url(r'^dashboard/blogs/(?P<slug>[\w-]+)/edit$', views.post_edit , name='blog-edit'),
	url(r'^dashboard/blogs/(?P<slug>[\w-]+)/delete$', views.BlogDelete.as_view() , name='blog-delete'),

	url(r'^dashboard/info/add/$', views.info_new, name='info-add'),
	url(r'^dashboard/info/(?P<pk>[0-9]+)/edit$', views.info_edit , name='info-edit'),
	url(r'^dashboard/info/(?P<pk>[0-9]+)/delete$', views.InfoDelete.as_view() , name='info-delete'),

	url(r'^dashboard/team/add/$', views.team_new, name='team-add'),
	url(r'^dashboard/team/(?P<pk>[0-9]+)/edit$', views.team_edit , name='team-edit'),
	url(r'^dashboard/team/(?P<pk>[0-9]+)/delete$', views.TeamDelete.as_view() , name='team-delete'),

	url(r'^dashboard/events/add/$', views.event_new, name='event-add'),
	url(r'^dashboard/events/(?P<slug>[\w-]+)/edit$', views.event_edit , name='event-edit'),
	url(r'^dashboard/events/(?P<slug>[\w-]+)/delete$', views.EventDelete.as_view() , name='event-delete'),

	url(r'^dashboard/events/(?P<slug>[\w-]+)/$', views.EventDetailView.as_view(), name='event-detail'),

	url(r'^dashboard/blogs/(?P<slug>[\w-]+)/$', views.BlogDetailView.as_view(), name='blog-detail'),

	# url(r'^dashboard/$',),

]
