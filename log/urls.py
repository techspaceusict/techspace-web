from django.conf.urls import url
from . import views
from django.contrib.auth.views import login, logout

app_name = 'log'

urlpatterns = [
	url(r'^login/$', login, name='login'),
	url(r'^logout/$', logout, name='logout'),
	url(r'^register/$', views.register, name='register'),
	
]