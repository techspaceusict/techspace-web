from django.conf.urls import url,include
from django.contrib import admin

from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import password_reset, password_reset_done, password_reset_confirm, password_reset_complete

from log import views as log_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^codeschool/', include('codeschool.urls')),
    url(r'^cogitans/', include('cogitans.urls')),
    url(r'^droidclub/', include('droidclub.urls')),
    url(r'^ecell/', include('ecell.urls')),
    url(r'^electrotech/', include('electrotech.urls')),
    url(r'^oslc/', include('oslc.urls')),
    url(r'^renderedusict/', include('renderedusict.urls')),
    url(r'^turingai/', include('turingai.urls')),
    url(r'^@(?P<name>[\w]+)/', include('log.urls')),
    url(r'^post/', include('blog.urls')),
    url(r'^community/', include('community.urls')),
    url(r'^events/', include('event.urls')),
    url(r'^latest-posts/', include('latest.urls')),
    url(r'^register/$', log_views.register, name='register'),
    url(r'^login/$', log_views.user_login, name='login'),
    url(r'^logout/$', log_views.user_logout, name='logout'),
	url(r'^reset-password/$', password_reset, name='reset_password'),
	url(r'^reset-password/done/$', password_reset_done, name='password_reset_done'),
	url(r'^reset-password/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$', password_reset_confirm, name='password_reset_confirm'),
	url(r'^reset-password/done/$', password_reset_complete, name='password_reset_complete'),




    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^', include('home.urls')),
]


if settings.DEBUG:
	urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
	urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
