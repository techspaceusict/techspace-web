from django.conf.urls import url
from .views import BlogListView, BlogDetailView

app_name = 'blog'

urlpatterns =[
	url(r'^$', BlogListView.as_view(), name='index'),
	url(r'^(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='detail'),
]