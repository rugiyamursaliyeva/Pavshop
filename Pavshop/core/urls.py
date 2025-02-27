from django.urls import path
from core.views import AboutUsView, ContactView, home, store_view

app_name = "core"

urlpatterns = [
    path('about-us/', AboutUsView.as_view(), name='about_us'),
    path('contact/', ContactView.as_view(), name='contact_us'),
    path('home/', home, name='home'),
    path('store/', store_view, name='store'),
    # path('product/<int:id>/', product_detail, name='product_detail'),
]