from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from blog.models import BlogPost

class PostSitemap(Sitemap):
    def items(self):
        return BlogPost.objects.all()


class StaticViewSitemap(Sitemap):
    def items(self):
        return ['about']

    def location(self,item):
        return reverse(item)
