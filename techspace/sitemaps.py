from django.contrib.sitemaps import sitemap
from django.urls import reverse
from blog.models import Post
class PostSitemap(Sitemap):
  def items(self):
    return Post.objects.all()
class StaticViewSitemap(Sitemap):
   def items(self):
    return ['about']
  def location(self,item):
    return reverse(item)
