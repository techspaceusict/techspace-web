from django.conf.urls import url
from .views import EventListView, EventDetailView

app_name = 'event'


urlpatterns = [
	url(r'^$', EventListView.as_view(), name='index'),
	url(r'^(?P<pk>[0-9]+)/$', EventDetailView.as_view(), name='detail'),

]