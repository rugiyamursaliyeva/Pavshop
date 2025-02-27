from django.db import models
from django.contrib.auth import get_user_model
from django.urls import reverse, reverse_lazy
from decimal import Decimal


User = get_user_model()
# Create your models here.

class AbstractModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True



class Category(AbstractModel):
    title = models.CharField('title', max_length=150) 

    class Meta:
        verbose_name_plural = 'Categories'

    def __str__(self) -> str:
        return self.title




class Tag(AbstractModel):
    title = models.CharField('title', max_length=150)

    def __str__(self) -> str:
        return self.title




class Brand(AbstractModel):
    title = models.CharField('title', max_length=150)
    slug = models.SlugField('slug',  unique=True)


    def __str__(self) -> str:
        return self.title
    
    def get_absolute_url(self):
        return reverse('product_list') + f'?brand_slug={self.slug}'
    
  




class Color(AbstractModel):
    title = models.CharField('title', max_length=225)
    hex_code = models.CharField(null=True,blank=True)

    def __str__(self) -> str:
        return self.title




class Review(AbstractModel):
    # title = models.CharField('title', max_length=225)
    message = models.TextField()
    product = models.ForeignKey('Product', related_name='reviews', on_delete=models.CASCADE)
    user = models.ForeignKey(User, related_name='reviews', on_delete=models.CASCADE)

    def __str__(self) -> str:
        return f'{self.user.username} / {self.product.title}'
        
    
    



class Productimage(AbstractModel):
    image = models.ImageField(upload_to='products/')
    product = models.ForeignKey("Product", related_name='images', on_delete=models.CASCADE)

    def __str__(self) -> str:
        return f"{self.product.title}'s image"




class Product(AbstractModel):
    title = models.CharField('title', max_length=255)
    brand = models.ForeignKey('Brand', related_name='products', on_delete=models.CASCADE)
    cover_image = models.ImageField('cover_image', upload_to='products/')
    small_description = models.CharField('small_description', max_length=255)
    base_description = models.CharField('base_description', max_length=255)
    description = models.TextField('description')
    category = models.ForeignKey('Category', related_name='products', on_delete=models.CASCADE)
    tag = models.ManyToManyField('Tag', related_name='products')
    color = models.ManyToManyField('Color', related_name='products')
    simple_facts = models.TextField('simple_facts')
    price = models.DecimalField(decimal_places=2, max_digits=10)
    discount = models.CharField(null=True, blank=True)
    slug = models.SlugField('slug', null=True, blank=True)
    banner_image = models.ImageField('banner_image', upload_to='products/', null=True, blank=True)

    def __str__(self) -> str:
        return self.title
    
    def get_absolute_url(self):
        return reverse_lazy('product:product_detail', kwargs = {'slug' : self.slug})
    
    def get_total_price(self):
        price = Decimal(self.price)
        if self.discount:
            discount_percentage = Decimal(self.discount)
            discount_amount = (price * discount_percentage) / Decimal('100')
            discounted_price = price - discount_amount
        else:
            discounted_price = price
        return discounted_price
    



class UserBasket(AbstractModel):
    user = models.ForeignKey(User, related_name='baskets', on_delete=models.CASCADE)
    is_active = models.BooleanField(default=True)

    def __str__(self) -> str:
        return f"{self.user.username}'s basket"
     


class BlockedIps(AbstractModel):
    ip_address = models.GenericIPAddressField('ip_address')
