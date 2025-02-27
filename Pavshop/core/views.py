from django.db.models.query import QuerySet
from django.forms import BaseModelForm
from django.http import HttpRequest, HttpResponse
from django.shortcuts import render, redirect,  get_object_or_404
from django.urls import reverse_lazy
from core.forms import ContactForm
from blog.models import SideBacrBaner
from order.models import Favourites
from product.models import Product

from django.contrib import messages
from .models import TeamMember, OurSponsors, CultureImage, OurAddress
from product.models import Product
from decimal import Decimal
from django.views.generic import CreateView, ListView, TemplateView
from django.utils.translation import gettext_lazy as _
from typing import Any
# Create your views here.


class ContactView(CreateView):
    template_name = 'contact.html'
    form_class = ContactForm
    success_url = reverse_lazy('core:contact_us')


    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        messages.add_message(self.request, messages.SUCCESS, _("Successfully sent!"))
        return super().form_valid(form)
    
    def form_invalid(self, form: BaseModelForm) -> HttpResponse:
        messages.add_message(self.request, messages.ERROR, _("Please correct the errors below and try again."))
        return self.render_to_response(self.get_context_data(form=form))
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # OurAddress modelinden ilk adres kaydını al ve context'e ekle
        context['our_address'] = OurAddress.objects.first()
        return context





class AboutUsView(ListView):
    model = TeamMember
    template_name = 'about-us.html'
    context_object_name = 'team_members'

    def get_context_data(self, **kwargs: Any):
        context = super().get_context_data(**kwargs)
        sponsors = OurSponsors.objects.all()
        culture_image = CultureImage.objects.all()
        context['culture_image'] = culture_image
        context['sponsors'] = sponsors
        return context


# def sponsors_view(request):
#     sponsors = OurSponsors.objects.all()
#     context = {
#         'sponsors': sponsors
#         }
#     return render(request, 'about-us.html', context)


def home(request):
    last_added_prods = Product.objects.order_by("created_at")[:8]

    for product in last_added_prods:
        price = Decimal(product.price)
        if product.discount:
            discount = Decimal(product.discount)
            discount_amount = (price * discount) / Decimal(100)
            product.discounted_price = price - discount_amount
        else:
            product.discounted_price = price

     

    context = {
        "last_added_prods": last_added_prods,

    }
    return render(request, 'index.html',context)



def product_detail(request, id):
    product = get_object_or_404(Product, id=id)

    if product.discount:
        price = Decimal(product.price)
        discount = Decimal(product.discount)
        discount_amount = (price * discount) / Decimal(100)
        product.discounted_price = price - discount_amount
    else:
        product.discounted_price = product.price


    context = {
        'product': product,
    }
    return render(request, 'product-detail.html', context)


def store_view(request):
    top_products = Product.objects.all()  # Ensure slug field is present in the queryset
 
    context = {
        'top_products': top_products,
    }
    return render(request, 'core:base.html', context)




# def contact(request):
#     form = ContactForm()

#     if request.method == 'POST':
#         form = ContactForm(data = request.POST)
#         # print(form.name , "------------")
#         if form.is_valid():
#             form.save()
#             messages.add_message(request, messages.SUCCESS, "Successfully sent!")
#             return redirect(reverse_lazy("core:contact_us"))

#     context = {
#         'form': form
#     }
#     return render(request, 'contact.html', context)