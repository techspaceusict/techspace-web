from django.conf.urls import url,include
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap

from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import password_reset, password_reset_done, password_reset_confirm, password_reset_complete

from log import views as log_views
from . import views
from ckeditor_uploader import views as uploader_views
from .forms import EmailValidationOnForgotPassword

from techspace.sitemaps import PostSitemap, StaticViewSitemap
from blog import views as blog_views
from . import views as base_views

sitemaps={
	'posts':PostSitemap,
	'static':StaticViewSitemap
}

urlpatterns = [
	url(r'^sitemap.xml', sitemap, {'sitemaps':sitemaps}),
	url(r'^posts/<int:id>', blog_views.post, name='post'),
	url(r'^about/<int:id>', base_views.about, name='about'),
    url(r'^alumni/', base_views.alumni, name='alumni'),

    url(r'^admin/', admin.site.urls),
    url(r'^codeschool/', include('codeschool.urls')),
    url(r'^cogitans/', include('cogitans.urls')),
    url(r'^droidclub/', include('droidclub.urls')),
    url(r'^ecell/', include('ecell.urls')),
    url(r'^electrotech/', include('electrotech.urls')),
    url(r'^oslc/', include('oslc.urls')),
    url(r'^renderedusict/', include('renderedusict.urls')),
    url(r'^turingai/', include('turingai.urls')),
    url(r'^@(?P<name>[\w.@+-]+)/', include('log.urls')),
    url(r'^post/', include('blog.urls')),
    url(r'^community/', include('community.urls')),
    url(r'^events/', include('event.urls')),
    url(r'^latest-posts/', include('latest.urls')),
    url(r'^register/$', log_views.register, name='register'),
    url(r'^login/$', log_views.user_login, name='login'),
    url(r'^logout/$', log_views.user_logout, name='logout'),
	url(r'^reset_password/$', password_reset,{'password_reset_form': EmailValidationOnForgotPassword} , name='reset_password'),
	url(r'^reset_password/done/$', password_reset_done, name='password_reset_done'),
	url(r'^reset_password/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$', password_reset_confirm, name='password_reset_confirm'),
	url(r'^reset_password/complete/$', password_reset_complete, name='password_reset_complete'),
    url(r'^send_activation_email/$', log_views.activate_email, name='send_activation_email'),
    url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$', log_views.activate, name='activate'),

    url(r'^ckeditor/upload/', uploader_views.upload, name='ckeditor_upload'),

    url(r'^ckeditor/', include('ckeditor_uploader.urls')),

    url(r'^', include('home.urls')),
]


if settings.DEBUG:
	urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
	urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
if settings.DEBUG == False:
    handler404 = views.handler404
    handler500 = views.handler500
