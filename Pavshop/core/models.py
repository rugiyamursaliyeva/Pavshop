from django.db import models
# from core.validators import validate_gmail
# Create your models here.

class AbstractModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Contact(AbstractModel):
    name = models.CharField('name', max_length=150)
    email = models.EmailField('email', max_length=200)
    phone = models.TextField('phone', max_length=200)
    subject = models.TextField('subject', max_length=200)
    message = models.TextField('massage', max_length=200)

    def __str__(self) -> str:
        return self.name

class OurAddress(AbstractModel):
    address = models.TextField()
    phone = models.TextField()
    email = models.EmailField()
    small_description = models.CharField(max_length=255)

    def __str__(self) -> str:
        return self.address


class TeamMember(models.Model):
    name = models.CharField(max_length=100)
    position = models.CharField(max_length=100)
    photo = models.ImageField(upload_to='team_photos/')

    def __str__(self):
        return self.name
    

class Subscribe(models.Model):
    email = models.EmailField('email', max_length=200, unique=True)  

    def __str__(self) -> str:
        return self.email  


class OurSponsors(models.Model):
    photo = models.ImageField(upload_to='sponsors_photos/')


class CultureImage(models.Model):
    image = models.ImageField(upload_to='images/')
    def __str__(self):
        return f'Image {self.id}'



