from django.contrib.sitemaps import sitemap
from blog.models import Post
class PostSitemap(Sitemap):
  def items(self):
    return Post.objects.all()
