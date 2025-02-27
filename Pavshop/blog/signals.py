from django.db.models.signals import post_save
from django.dispatch import receiver
from blog.models import BlogPost
from django.utils.text import slugify 


@receiver(post_save, sender=BlogPost)
def slug(instance, created, *args, **kwargs):
    if created:
        instance.slug = slugify(instance.title) + str(instance.id)
        instance.save()





# pre_save - obeykti admin panelden save etmemisden qabaq title sluga cevirir sonra save edir.(bununla yazmaq coxda duzgun deyil)
# post_save - save olunandan sonra sluga cevirir    
# import slugify - title'larda bosluq deyil -ile yazir