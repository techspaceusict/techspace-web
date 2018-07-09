from django.conf.urls import url
from .views import EventDetailView, EventView

app_name = 'event'


urlpatterns = [
	url(r'^$', EventView.as_view(), name='events'),
	url(r'^(?P<slug>[\w-]+)/$', EventDetailView.as_view(), name='detail'),
]
