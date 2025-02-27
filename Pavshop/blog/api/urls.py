from django.urls import path
from blog.api.views import CategoryAPIView, BlogTagAPIView, BlogPostAPIView, BlogUpdateAPIView

app_name = 'blog_api'  # app_name tanımlayın

urlpatterns = [
    path('blogcategories/', CategoryAPIView.as_view(), name = 'blogcategories'),
    path('blogtags/', BlogTagAPIView.as_view(), name = 'blogtags'),
    path('blogs/', BlogPostAPIView.as_view(), name='blogs'),
    path('blogs/<int:pk>/', BlogUpdateAPIView.as_view(), name='blogs_update')
]