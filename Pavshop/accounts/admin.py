from django.contrib import admin
from accounts.models import Country
from django.contrib.auth import get_user_model

User = get_user_model()
# Register your models here.

admin.site.register(User)
admin.site.register(Country)