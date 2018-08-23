from django.conf.urls import url, include
from .views import index, achievements#, contactSubmit

app_name = 'home'

urlpatterns = [
	url(r'^$', index, name='index'),
	url(r'^achievements/$',achievements, name='achievements')
	# url(r'^contact/submit/$', contactSubmit, name='contactSubmit'),

]
