from django.db.models.signals import pre_save
from django.dispatch import receiver
from product.models import Product
from django.utils.text import slugify

@receiver(pre_save, sender=Product)
def update_slug(sender, instance, **kwargs):
    if instance.pk:  # Check if the instance already exists (i.e., it's an update)
        original = Product.objects.get(pk=instance.pk)

        # Check if the title has changed
        if original.title != instance.title:
            instance.slug = slugify(instance.title)
    else:
        # This is a new object
        instance.slug = slugify(instance.title)
