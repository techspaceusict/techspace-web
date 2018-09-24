from django.conf.urls import url, include
from .views import index, achievements, responsible_disclosure, hall_of_fame#, contactSubmit

app_name = 'home'

urlpatterns = [
	url(r'^$', index, name='index'),
	url(r'^achievements/$',achievements, name='achievements'),
	url(r'^responsible_disclosure$', responsible_disclosure, name='responsible_disclosure' ),
	url(r'^hall_of_fame/$', hall_of_fame, name='hall_of_fame'),


	# url(r'^contact/submit/$', contactSubmit, name='contactSubmit'),

]
