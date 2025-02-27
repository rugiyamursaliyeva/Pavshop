from django.urls import path
from order.views import CheckoutView, ShoppingCartListView, add_to_fav, remove_from_fav, FavouriteListView, add_to_cart, remove_from_cart
app_name="order"
urlpatterns = [
    path('checkout/', CheckoutView.as_view(), name= 'checkout'),
    path('shopping-cart/', ShoppingCartListView.as_view(), name= 'shopping_cart'),
    path('add-to-fav/<int:id>/', add_to_fav, name= 'add_to_fav'),
    path('remove-from-fav/<int:id>/', remove_from_fav, name= 'remove_from_fav'),
    path('favourites/', FavouriteListView.as_view(), name='favourites'),
    path('add-to-cart/<int:id>/', add_to_cart, name='add_to_cart'),
    path('remove-from-cart/<int:id>/', remove_from_cart, name='remove_from_cart'),
    # path('remove-from-cart/<int:id>/', remove_from_cart, name='remove_from_cart'), 
    # path('cart/', cart_view, name='cart_view'),
    
    
]