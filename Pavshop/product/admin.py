from django.contrib import admin
from product.models import Category, Tag, Brand, Color, Review, Productimage, Product, BlockedIps
from order.models import UserBasket
from modeltranslation.admin import TranslationAdmin
# Register your models here.


# admin.site.register(Color)
# admin.site.register(Category)
# admin.site.register(Tag)
# admin.site.register(Brand)
admin.site.register(Review)
admin.site.register(Productimage)
admin.site.register(UserBasket)
admin.site.register(BlockedIps)


@admin.register(Category)
class CategoryAdmin(TranslationAdmin):
    fields = ['title']

@admin.register(Tag)
class TagAdmin(TranslationAdmin):
    fields = ['title']


class ProductimageInline(admin.TabularInline):
    model = Productimage

@admin.register(Product)
class ProductModelAdmin(TranslationAdmin):
    # fields = ['*']
    list_display = ['id', 'title', 'get_tag', 'category']
    list_display_links = ['id', 'title']
    list_editable = ['category']
    list_filter = ['category']
    search_fields = ['title', 'category__title']
    inlines = [ProductimageInline]
    # prepopulated_fields = {"slug": ("title",)}

    
    def get_tag(self, obj):
        tag = []
        for tags in obj.tag.all():
            tag.append(tags.title)
            return tag



@admin.register(Color)
class ColorModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'hex_code']
    list_display_links = ['id', 'title']
    list_editable = ['hex_code']
    
@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug')
    prepopulated_fields = {'slug': ('title',)}
    fields = ('title', 'slug')  # Ensure both fields are included
