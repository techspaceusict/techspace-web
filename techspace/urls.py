from django.conf.urls import url,include
from django.contrib import admin

from django.conf import settings
from django.conf.urls.static import static

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
    url(r'^accounts/', include('log.urls')),
    url(r'^blogs/', include('blog.urls')),
    url(r'^community/', include('community.urls')),
    url(r'^events/', include('event.urls')),
    url(r'^', include('home.urls')),
]


if settings.DEBUG:
	urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
	urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
