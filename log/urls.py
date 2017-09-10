from django.conf.urls import url
<<<<<<< HEAD
from .views import register, user_logout, dashboard, messages
from django.contrib.auth.views import login
=======
from .views import register, user_login, user_logout, dashboard, messages, blogs, events
# from django.contrib.auth.views import login, logout
>>>>>>> bd582e2569342f2e09acea4a512f95e6ddbe2e93



app_name = 'log'

urlpatterns = [
	# url(r'^login/$', login, name='login'),
	# url(r'^logout/$', logout, name='logout'),
	url(r'^register/$', register, name='register'),
	url(r'^login/$', login, name='login'),
	url(r'^logout/$', user_logout, name='logout'),
	url(r'^dashboard/$', dashboard, name='dashboard'),
	url(r'^dashboard/messages/', messages, name='messages'),
	url(r'^dashboard/blogs/', blogs, name='blogs'),
	url(r'^dashboard/events/', events, name='events'),
	# url(r'^dashboard/$',),
	
]