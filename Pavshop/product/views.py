from typing import Any
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.shortcuts import render, get_object_or_404
from product.models import Product, Tag, Category, Brand, Color
from django.views.generic import ListView, DetailView
from django.views.generic.edit import FormMixin
from product.forms import AddToCartForm, ReviewForm
from django.db.models.query import QuerySet
from order.models import Favourites, UserBasket
from blog.models import SideBacrBaner
# Create your views here.



class UserBasketProsessr(ListView):
     model = UserBasket
     context_object_name = 'UserBasket'

     def get_queryset(self):
        return UserBasket.objects.filter(user=self.request.user)

     def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        basket_items = context['basket_items']
    
        total_price = sum(item.get_total_price() for item in basket_items)
        
        context['total_price'] = total_price 
        return context
     
     def get_total_basket_price(self):
         basket_items = UserBasket.objects.filter(user=self.request.user)
         total_price = sum(item.product.get_total_price() for item in basket_items)
         return total_price
     


class ProductListView(ListView):
     model = Product
     template_name = 'product-list.html'
     context_object_name = 'products'
     paginate_by = 4
     

     # category filter
     def get_queryset(self) -> QuerySet[Any]:
        queryset = super().get_queryset()
        category = self.request.GET.get('category')
        tag = self.request.GET.get('tag')
        title = self.request.GET.get('title')
        brand_slug = self.request.GET.get('brand_slug')
        color_id = self.request.GET.get('color')   # URL'den marka slug'ını al
        if category:
            queryset = queryset.filter(category__id = category)
        if tag:
            queryset = queryset.filter(tag__id = tag)
        if title:
            queryset = queryset.filter(title__icontains=title)
        if brand_slug:
            queryset = queryset.filter(brand__slug=brand_slug) 
        if color_id:
            queryset = queryset.filter(color__id=color_id)  # Markaya göre filtrele
        # if tag and category:
        #      queryset = queryset.filter(tag__id = tag, category__id = category)
        return queryset
     


     def get_context_data(self, **kwargs: Any) -> dict[str, Any]:
        context = super().get_context_data(**kwargs)
        side_banners = SideBacrBaner.objects.all()
        context['side_banners'] = side_banners
        context['categories'] = Category.objects.all()
        context['tag_list'] = Tag.objects.all()
        context['brands'] = Brand.objects.all()
        context['colors'] = Color.objects.all()

        
        for prod in context['products']:
               if prod.discount:
                    prod.discounted_price = prod.price - ((prod.price * int(prod.discount)) / 100)

        user = self.request.user    
        if user.is_authenticated:
            user = self.request.user
            user_fav_products = [i.product for i in Favourites.objects.filter(user=user)]
            print(user_fav_products, "-------------")


            for prod in context['products']:
                if prod in user_fav_products:
                        prod.in_favourite = True
                else:
                    prod.in_favourite = False
        return  context
     
     
     

# def product_list(request):
#     prods = Product.objects.all().order_by('created_at')
#     tags = Tag.objects.all()
#     categories = Category.objects.all()

#     for prod in prods:
#         if prod.discount:
#             prod.discounted_price = prod.price - ((prod.price*int(prod.discount))/100)
#             print(prod.discounted_price, "------------")

#     context = {
#         "products": prods,
#         "tag_list": tags,
#         "categories": categories, 
#     }
#     return render(request, 'product-list.html', context=context)




class ProductDetailView(FormMixin, DetailView):
    model = Product
    template_name = 'product-detail.html'
    form_class = ReviewForm
    add_to_cart_form_class = AddToCartForm  # Add your AddToCartForm
    # success_url = reverse_lazy('core:index_us')

    def get_success_url(self) -> str:
         return reverse_lazy('product:product_detail', kwargs={'slug': self.object.slug})


    def get_context_data(self, **kwargs: Any) -> dict[str, Any]:
        context = super().get_context_data(**kwargs)
        product = self.object
        
        # Calculate discounted price if any
        if product.discount:
            product.discounted_price = product.price - ((product.price * int(product.discount)) / 100)

        # Fetch related products
        related_objects = Product.objects.all()
        for prod in related_objects:
            if prod.discount:
                prod.discounted_price = prod.price - ((prod.price * int(prod.discount)) / 100)
        
        context["related_objects"] = related_objects
        context["brand"] = product.brand

        # User favorite products
        user = self.request.user    
        if user.is_authenticated:
            user_fav_products = [i.product for i in Favourites.objects.filter(user=user)]
            is_exist = Favourites.objects.filter(user=user, product=self.object).exists()

            product.in_favourite = is_exist  # Set in_favourite based on existence in Favourites
            context["product"] = product

        # Add the AddToCartForm instance to the context
        context['add_to_cart_form'] = self.add_to_cart_form_class()

        return context

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        self.object = self.get_object()
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
        

    def form_valid(self, form: Any) -> HttpResponse:
            form.instance.user = self.request.user
            form.instance.product= self.object
            form.save()
            return super().form_valid(form)
        






# def product_detail(request, pk):
#     product = get_object_or_404(Product, id=pk)
# override
#     if product.discount:
#             product.discounted_price = product.price - ((product.price*int(product.discount))/100)
#             print(product.discounted_price, "------------")
#     context = {
#         'product' : product
#     }
#     return render(request, 'product-detail.html', context)





# category dovr etmek 
    # category_counts = []
    # for category in categories:
    #     product_count = category.products.count()  # Count the number of blogs in each category
    #     category_counts.append((category, product_count))

    # for prod in prods:
    #     if prod.diccount:
    #         prod.discounted_price = prod.price - ((prod.price*int(prod.diccount))/100)
    #         print(prod.discounted_price, "------------")

