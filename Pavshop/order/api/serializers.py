from rest_framework import serializers
from order.models import ShoppingCart

class ShoppingCartSerializer(serializers.ModelSerializer):
    total_price = serializers.SerializerMethodField()

    class Meta:
        model = ShoppingCart
        fields = ['id', 'cart', 'product', 'quantity', 'total_price']

    def get_total_price(self, obj):
        product = obj['product']
        quantity = obj['quantity']
        return (product.price if not product.discount else product.get_total_price()) * quantity

    def validate_quantity(self, value):
        """
        Ensure that quantity is at least 1.
        """
        if value < 1:
            raise serializers.ValidationError("Quantity must be at least 1.")
        return value

