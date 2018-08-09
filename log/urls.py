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

	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='post-detail'),

	# url(r'^dashboard/events/$', events, name='events'),
	# url(r'^dashboard/blogs/add/$', post_new, name='post-add'),
	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/edit$', post_edit , name='post-edit'),
	# url(r'^dashboard/blogs/(?P<pk>[0-9]+)/delete$', BlogDelete.as_view() , name='blog-delete'),

	url(r'^$', views.dashboard, name='dashboard'),
	url(r'^portfolio/$', views.portfolio, name='portfolio'),
	url(r'^discussions/$', views.discussions, name='discussions'),
	url(r'^comments/$', views.comments, name='comments'),
	url(r'^edit/$', views.userProfileEdit, name='edit_profile'),
	url(r'^report/$', views.userReport, name='report_user'),
	url(r'^message/$', views.sendMessage, name='send_message'),
	url(r'^inbox/$', views.inbox, name='inbox'),


	# url(r'^messages/$', views.messages, name='messages'),
	# url(r'^info/$', views.info, name='info'),
	# url(r'^info/(?P<pk>[0-9]+)/$', views.InfoDetailView.as_view(), name='info-detail'),
	#
	# url(r'^team/$', views.team, name='team'),
	# url(r'^team/(?P<pk>[0-9]+)/$', views.TeamDetailView.as_view(), name='team-detail'),
	#
	# url(r'^info/add/$', views.info_new, name='info-add'),
	# url(r'^info/(?P<pk>[0-9]+)/edit$', views.info_edit , name='info-edit'),
	# url(r'^info/(?P<pk>[0-9]+)/delete$', views.InfoDelete.as_view() , name='info-delete'),
	#
	# url(r'^team/add/$', views.team_new, name='team-add'),
	# url(r'^team/(?P<pk>[0-9]+)/edit$', views.team_edit , name='team-edit'),
	# url(r'^team/(?P<pk>[0-9]+)/delete$', views.TeamDelete.as_view() , name='team-delete'),



	# url(r'^dashboard/$',),

]
