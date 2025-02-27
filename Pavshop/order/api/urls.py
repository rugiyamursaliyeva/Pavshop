from django.urls import path
from .views import ShoppingCartListCreateAPIView, ShoppingCartDetailAPIView, update_cart_quantity

app_name = 'order_api'

urlpatterns = [
    path('cart/', ShoppingCartListCreateAPIView.as_view(), name='cart-list-create'),
    path('cart/<int:pk>/', ShoppingCartDetailAPIView.as_view(), name='cart-detail'),
    path('cart/update-quantity/<int:pk>/', update_cart_quantity, name='update_cart_quantity'),
]
