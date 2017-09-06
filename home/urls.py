from django.conf.urls import url
from .views import index, contactSubmit

app_name = 'home'

urlpatterns = [
	url(r'^$', index, name='index'),
	url(r'^contact/submit/$', contactSubmit, name='contactSubmit')

]
