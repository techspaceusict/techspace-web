from django.conf.urls import url
from .views import index, BlogPostView, EventListView
from django.views.generic import TemplateView

app_name = 'codeschool'

urlpatterns = [
	url(r'^$',index,name='index'),
	url(r'^blogs/$', BlogPostView.as_view(), name='post'),
	url(r'^events/$', EventListView.as_view(), name='events'),
	url(r'^team/$', TemplateView.as_view(template_name='clubs/codeschool/team.html'), name='teams'),
	url(r'^classes/$', TemplateView.as_view(template_name='clubs/codeschool/classes.html'), name='classes'),
	url(r'^contests/$', TemplateView.as_view(template_name='clubs/codeschool/contests.html'), name='contests'),
	url(r'^calendar/$', TemplateView.as_view(template_name='clubs/codeschool/calendar.html'), name='calendar'),
	url(r'^connect/$', TemplateView.as_view(template_name='clubs/codeschool/connect.html'), name='connect'),
]