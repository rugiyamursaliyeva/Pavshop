from .models import UserBasket
from order.models import ShoppingCart
from decimal import Decimal

def basket_total(request):
    if request.user.is_authenticated:
        user_basket = UserBasket.objects.filter(user=request.user, is_active=True).first()
        basket_items = ShoppingCart.objects.filter(cart=user_basket)
        total_price = sum(
            (Decimal(item.product.price) * item.quantity)
            if not item.product.discount
            else (Decimal(item.product.price) * (1 - Decimal(item.product.discount) / 100) * item.quantity)
            for item in basket_items
        )

        return {
            'basket_items': basket_items,
            'total_price': total_price,
        }
    return {'basket_items': [], 'total_price': 0}
