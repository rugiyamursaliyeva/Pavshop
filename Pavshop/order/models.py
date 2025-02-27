from django.db import models
from product.models import Product, UserBasket
from django.contrib.auth import get_user_model
User = get_user_model()
# Create your models here.

class AbstractModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class BillingDetails(AbstractModel):
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    company_name = models.CharField(max_length=150)
    address = models.TextField()
    city = models.TextField()
    country = models.TextField()
    email = models.EmailField()
    phone = models.TextField()

    def __str__(self) -> str:
        return f"{self.first_name}'s billing details"
    


class Checkout(AbstractModel):
    basket = models.ForeignKey(UserBasket, on_delete=models.CASCADE, default=1)
    final_price = models.PositiveIntegerField() # sifaris olan mehsulun negatif sayı olmaması için PositiveIntegerField istif. edilir.
    is_paid = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f"{self.product.title} for {self.user.username}"
    



class Favourites(AbstractModel):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(User, max_length=100, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user.username} - {self.product.title}"





    # def get_total_price(self):
    #     """
    #     Sepetteki tüm ürünlerin toplam fiyatını hesaplar.
    #     """
    #     total = sum(item.get_total_price() for item in self.cart_items.all())
    #     return total 
    

class ShoppingCart(AbstractModel):
    cart = models.ForeignKey(UserBasket, related_name='cart_items', on_delete=models.CASCADE)
    product = models.ForeignKey(Product, related_name='cart_items', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.product.title} - {self.quantity} units" 

    def get_total_price(self):
        """
        Sepetteki bu ürün için toplam fiyati döndürür (ürün indirimli fiyati * miktar).
        """
        return self.product.get_total_price() * self.quantity
    



