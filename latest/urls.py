from django.conf.urls import url
from .views import LatestPostsListView , LatestPostsDetailView

app_name = 'latest'


urlpatterns = [
	url(r'^$', LatestPostsListView.as_view(), name='latest_posts'),
	url(r'^(?P<slug>[\w-]+)/$', LatestPostsDetailView.as_view(), name='latest_posts_detail'),
]
