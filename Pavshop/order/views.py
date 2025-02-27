from typing import Any
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse, reverse_lazy
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django import forms
from order.form import BillingDetailstForm
from product.forms import AddToCartForm
from product.models import Product, UserBasket
from .models import Product, ShoppingCart  # ShoppingCart modelini ve Product modelini içe aktarın
from order.models import Favourites, ShoppingCart, Checkout
from django.views.generic import FormView
from django.views.generic import ListView
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
# from order.form import ShippingInfoForm
# Create your views here.


class CheckoutView(FormView):
    model = Checkout
    template_name = 'checkout.html'
    context_object_name = 'cart_items'
    form_class = BillingDetailstForm
    success_url = reverse_lazy('order:checkout')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        
        # Kullanıcının aktif sepetini alın
        active_basket = UserBasket.objects.filter(user=user, is_active=True).first()

        # Eğer aktif bir sepet varsa, ona bağlı ShoppingCart öğelerini alın
        if active_basket:
            cart_items = ShoppingCart.objects.filter(cart=active_basket)
            total_price = sum(item.get_total_price() for item in cart_items)
            context['cart_items'] = cart_items
            context['total_price'] = total_price
        else:
            context['cart_items'] = []
            context['total_price'] = 0
        return context

    def form_valid(self, form):
        # Form verilerini kaydet
        billing_details = form.save(commit=False)  # Formdan gelen verileri kaydet
        billing_details.user = self.request.user   # Kullanıcıyı bağlayın
        billing_details.save()

        # Checkout işlemleri (kendi Checkout modelinize göre bu kısmı düzenleyin)
        # Burada checkout işlemleri yapabilirsiniz, örneğin sepetteki ürünleri çekip işlem yapabilirsiniz.
        
        messages.success(self.request, "Billing details saved successfully.")
        return super().form_valid(form)




class ShoppingCartListView(ListView):
    model = ShoppingCart
    template_name = 'shopping-cart.html'
    context_object_name = 'cart_items'
    
    def get_queryset(self):
        # Get the active basket for the logged-in user
        user = self.request.user
        active_basket = UserBasket.objects.filter(user=user, is_active=True).first()

        # Return the shopping cart items related to the active basket
        if active_basket:
            return ShoppingCart.objects.filter(cart=active_basket)
        else:
            return ShoppingCart.objects.none()
    
    def get_total_price(self):
        # """
        # Sepetteki bu ürün için toplam fiyatı döndürür (ürün indirimli fiyatı * miktar).
        # """
        return (self.product.price if not self.product.discount else self.product.get_total_price()) * self.quantity

    
    def get_context_data(self, **kwargs):
        # Varsayılan bağlam verilerini alır
        context = super().get_context_data(**kwargs)
        # Toplam maliyeti hesapla
        total_cost = sum(item.get_total_price() for item in context['cart_items'])
        # Toplam maliyeti bağlama ekle
        context['total_cost'] = total_cost
        return context
    

# def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         cart_items = context['cart_items']

#         # Sepetteki tüm ürünlerin toplam fiyatını hesaplıyoruz
#         cart_total = sum(item.get_total_price() for item in cart_items)
        
#         context['cart_total'] = cart_total
#         return context


# def checkout(request):
#     billing_form = BillingDetailstForm()
    # shippingform = ShippingInfoForm()

    # if request.method == 'POST':
    #     billing_form = BillingDetailstForm(data = request.POST)
        # shippingform = ShippingInfoForm(data = request.POST)
        # print(form.name , "------------")
        # if billing_form.is_valid():
        #     billing_form.save()
            # shippingform.save()

            # return redirect("")
        
        
    # context = {
    #     'billing_form' : billing_form,
    #     # "shipping_form": shippingform
    # }
    # return render(request, 'checkout.html', context)
    

# def shopping_cart(request):
#     return render(request, 'shopping-cart.html')



def add_to_fav(request, id):
    product = Product.objects.get(pk=id)
    user = request.user
    if user.is_authenticated:
        fav_exists = Favourites.objects.filter(user=user, product=product).exists()

        if not fav_exists:
            Favourites.objects.create(user=user, product=product)  

    else:
        return redirect(reverse_lazy('accounts:login'))



    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def remove_from_fav(request, id):
    product = Product.objects.get(pk=id)
    user = request.user
    fav_prod = Favourites.objects.filter(user=user, product=product)

    if fav_prod is not None:
        fav_prod.delete()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    

@method_decorator(login_required, name='dispatch')
class FavouriteListView(ListView):
    model = Product
    template_name = 'favourites.html'
    context_object_name = 'favourites'

    # def get_queryset(self):
    #     user = self.request.user
    #     if user.is_authenticated:
    #         return Product.objects.filter(user=user)
    #     return Product.objects.none()
    
    def get_context_data(self, **kwargs: Any) -> dict[str, Any]:
        context = super().get_context_data(**kwargs)
        user = self.request.user
         
        context['products'] = [i.product for i in Favourites.objects.filter(user=user)]

        for prod in context['products']:
               if prod.discount:
                    prod.discounted_price = prod.price - ((prod.price * int(prod.discount)) / 100)

        user = self.request.user    
        if user.is_authenticated:
            user = self.request.user
            user_fav_products = [i.product for i in Favourites.objects.filter(user=user)]


            for prod in context['products']:
                if prod in user_fav_products:
                    prod.in_favourite = True
                else:
                    prod.in_favourite = False

        for i in context['products']:
            print(i.discount)
            print(i.get_total_price)
        return  context
    


def add_to_cart(request, id):
    # Ensure the user is authenticated
    if not request.user.is_authenticated:
        return redirect('login')  # Redirect to login if the user isn't authenticated

    product = get_object_or_404(Product, pk=id)
    
    if request.method == 'POST':
        form = AddToCartForm(request.POST)

        if form.is_valid():
            quantity = form.cleaned_data['quantity']
            user = request.user
            
            # Get or create an active basket for the user
            user_basket, created = UserBasket.objects.get_or_create(user=user, is_active=True)

            # Check if the product is already in the cart
            cart_item = ShoppingCart.objects.filter(cart=user_basket, product=product).first()

            if cart_item:
                # If the product is already in the cart, update the quantity
                cart_item.quantity += quantity
                cart_item.save()
            else:
                # If the product is not already in the cart, add it
                ShoppingCart.objects.create(cart=user_basket, product=product, quantity=quantity)

            # Redirect back to the product detail page with a success message
            return redirect('product:product_detail', slug=product.slug)  # Adjust to your URL pattern

    return redirect('product:product_detail', slug=product.slug)  # Handle case where form is invalid

def remove_from_cart(request, id):
    if not request.user.is_authenticated:
        return redirect('login')  # Eğer kullanıcı giriş yapmadıysa, login sayfasına yönlendirme yap

    product = get_object_or_404(Product, pk=id)  # Ürünü güvenli bir şekilde al
    user = request.user
    active_basket = UserBasket.objects.filter(user=user, is_active=True).first()
    
    # Sepetteki ürünü kontrol et ve kaldır
    cart_item = ShoppingCart.objects.filter(cart=active_basket, product=product)
    
    if cart_item.exists():
        cart_item.delete()  # Ürün sepette varsa kaldır

    # Kullanıcıyı önceki sayfaya geri yönlendir
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/')) 
