from django.conf.urls import url
from .views import BlogDetailView

app_name = 'blog'

urlpatterns =[
	url(r'^(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='detail'),
]