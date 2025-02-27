from django.contrib import admin
from order.models import BillingDetails, Checkout, Favourites, ShoppingCart
# Register your models here.

admin.site.register(BillingDetails)
admin.site.register(Checkout)
admin.site.register(ShoppingCart)
# admin.site.register(Favourites)

# admin.site.register(ShippingInfo)


@admin.register(Favourites)
class FavouritesModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'get_id']
    list_display_links = ['id']
    list_editable = ['user', "product"]

    def get_id(self, obj):
        if obj.product:
            return obj.product.id
        else:
            return None

    
