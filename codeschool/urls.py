from django.conf.urls import url
from .views import index, BlogPostView, BlogDetailView

app_name = 'codeschool'

urlpatterns = [
	url(r'^$',index,name='index'),
	url(r'^blog/$', BlogPostView.as_view(), name='post'),
	url(r'^(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='detail'),
]