from rest_framework import generics, status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from order.models import ShoppingCart
from product.models import Product, UserBasket
from .serializers import ShoppingCartSerializer
from django.shortcuts import get_object_or_404
from rest_framework.generics import UpdateAPIView

class ShoppingCartListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = ShoppingCartSerializer

    def get_queryset(self):
        """
        Return the shopping cart items for the logged-in user.
        """
        user = self.request.user
        user_basket = get_object_or_404(UserBasket, user=user, is_active=True)
        return ShoppingCart.objects.filter(cart=user_basket)

    def perform_create(self, serializer):
        """
        Add a product to the user's cart or update the quantity if it already exists.
        """
        user = self.request.user
        user_basket, created = UserBasket.objects.get_or_create(user=user, is_active=True)
        product = serializer.validated_data.get('product')
        
        # Check if the product is already in the cart
        cart_item = ShoppingCart.objects.filter(cart=user_basket, product=product).first()

        if cart_item:
            # Update quantity if the product is already in the cart
            cart_item.quantity += serializer.validated_data.get('quantity', 1)
            print(cart_item.quantity)
            cart_item.save()
        else:
            # Create a new cart item
            serializer.save(cart=user_basket)

class ShoppingCartDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = ShoppingCart.objects.all()
    serializer_class = ShoppingCartSerializer

    def get_object(self):
        """
        Retrieve the shopping cart item by id for the logged-in user.
        """
        user = self.request.user
        obj = get_object_or_404(ShoppingCart, pk=self.kwargs['pk'], cart__user=user)
        return obj

    def delete(self, request, *args, **kwargs):
        """
        Remove a product from the cart.
        """
        cart_item = self.get_object()
        cart_item.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['PATCH'])
def update_cart_quantity(request, pk):
    """
    Update the quantity of a specific cart item and return updated prices.
    """
    try:
        cart_item = ShoppingCart.objects.get(pk=pk)
    except ShoppingCart.DoesNotExist:
        return Response({"error": "Cart item not found"}, status=status.HTTP_404_NOT_FOUND)

    new_quantity = request.data.get('quantity')
    
    if new_quantity and int(new_quantity) > 0:
        cart_item.quantity = int(new_quantity)
        cart_item.save()

        # Recalculate total cost for all cart items
        user = cart_item.cart.user
        active_basket = UserBasket.objects.filter(user=user, is_active=True).first()
        cart_items = ShoppingCart.objects.filter(cart=active_basket)
        total_cost = sum(item.get_total_price() for item in cart_items)
        
        # Return updated data
        return Response({
            'total_price': cart_item.get_total_price(),
            'total_cost': total_cost
        }, status=status.HTTP_200_OK)
    
    return Response({"error": "Invalid quantity"}, status=status.HTTP_400_BAD_REQUEST)
