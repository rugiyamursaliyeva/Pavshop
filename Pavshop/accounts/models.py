from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.postgres.fields import ArrayField
# Create your models here.



class Country(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class User(AbstractUser):
    city = models.TextField()
    address = models.TextField()
    phone = models.TextField()
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, null=True, blank=True)
    photo = models.ImageField('photo', upload_to='user_profiles/', null=True, blank=True)
    ips = ArrayField(models.GenericIPAddressField(), null=True, blank=True)
    email = models.EmailField(("email address"), blank=True, unique=True)  

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = 'username',

    def get_image(self):
        if self.photo:
            return self.photo.url
        return '/static/user_profiles/nophoto.jpg/'

