from django.urls import path
from product.api.views import CategoryAPIView, TagAPIView, ProductAPIView, ProductUpdateView, SubscribeAPIView

app_name = 'product_api'  # app_name tanımlayın

urlpatterns = [
    path('categories/', CategoryAPIView.as_view(), name = 'categories'),
    path('tags/', TagAPIView.as_view(), name = 'tags'),
    path('products/', ProductAPIView.as_view(), name='products'),
    path('products/<int:pk>/', ProductUpdateView.as_view(), name='products_update'),
    path('subscriber/', SubscribeAPIView.as_view(), name='subscriber')
]