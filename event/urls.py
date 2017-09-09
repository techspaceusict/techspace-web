from django.conf.urls import url
from .views import EventDetailView

app_name = 'event'


urlpatterns = [
	url(r'^(?P<pk>[0-9]+)/$', EventDetailView.as_view(), name='detail'),
]