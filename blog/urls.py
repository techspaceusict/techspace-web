from django.conf.urls import url
from .views import blogDetailView, BlogListView

app_name = 'blog'

urlpatterns =[
	url(r'^$', BlogListView.as_view(), name='blogs'),
	url(r'^(?P<slug>[\w-]+)/$', blogDetailView, name='detail'),
]
