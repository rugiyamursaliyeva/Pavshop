from django.urls import path
from product.views import  ProductListView, ProductDetailView
# from product.views import  ProductListView, product_detail


app_name="product"
urlpatterns = [
    path('product-list/', ProductListView.as_view(), name= 'product_list'),
    path('product/<str:slug>/', ProductDetailView.as_view(), name= 'product_detail'),
    # path('product/<int:pk>/', product_detail, name= 'product_detail'), 

]
 