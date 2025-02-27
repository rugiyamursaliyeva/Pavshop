from django.template import Library
from django.urls import reverse_lazy
# from products.models import

register = Library()

@register.simple_tag
def is_active(request, url_name):
    if request.path == reverse_lazy(url_name):
        return 'active'
    return ''