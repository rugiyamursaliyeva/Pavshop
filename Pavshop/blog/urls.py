from django.urls import path
from blog.views import BlogDetailView, BlogListView

app_name="blog"

urlpatterns = [
    path('blog/<str:slug>/', BlogDetailView.as_view(), name= 'blog_detail-us'),
    path('blog-list/', BlogListView.as_view(), name= 'blog_list-us')
]