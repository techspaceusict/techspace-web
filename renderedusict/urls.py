from django.conf.urls import url
from .views import index, BlogPostView, EventListView

app_name = 'renderedusict'

urlpatterns = [
	url(r'^$',index,name='index'),
	url(r'^blog/$', BlogPostView.as_view(), name='post'),
	url(r'^events/$', EventListView.as_view(), name='events'),
]