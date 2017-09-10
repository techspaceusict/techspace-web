from django.conf.urls import url
from .views import register, user_login, user_logout, dashboard, messages, blogs, events
# from django.contrib.auth.views import login, logout



app_name = 'log'

urlpatterns = [
	# url(r'^login/$', login, name='login'),
	# url(r'^logout/$', logout, name='logout'),
	url(r'^register/$', register, name='register'),
	url(r'^login/$', user_login, name='login'),
	url(r'^logout/$', user_logout, name='logout'),
	url(r'^dashboard/$', dashboard, name='dashboard'),
	url(r'^dashboard/messages/', messages, name='messages'),
	url(r'^dashboard/blogs/', blogs, name='blogs'),
	url(r'^dashboard/events/', events, name='events'),
	# url(r'^dashboard/$',),
	
]