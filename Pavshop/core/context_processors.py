from product.models import Product


def store_products(request):
    top_products = Product.objects.order_by("created_at")[:3]  # 

    return {
        'top_products': top_products,
    }

from blog.models import SideBacrBaner

def banner(request):
    side_banners = SideBacrBaner.objects.all()

    return{
        'side_banners': side_banners,
    }

