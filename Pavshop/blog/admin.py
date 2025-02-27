from django.contrib import admin
from blog.models import Category, BlogTag, BlogPost, BlogComment, CultureBlock, SideBacrBaner
from modeltranslation.admin import TranslationAdmin
# Register your models here.


# admin.site.register(Category)
# admin.site.register(BlogTag)
admin.site.register(BlogComment)
admin.site.register(CultureBlock)
admin.site.register(SideBacrBaner)

@admin.register(BlogPost)
class BlogPostModelAdmin(TranslationAdmin):
    list_display = ['id', 'title', 'get_tag', 'category', "author"]
    list_display_links = ['id', 'title']
    list_editable = ['category', "author"]
    list_filter = ['category']
    search_fields = ['title', 'category__title']
    prepopulated_fields = {"slug": ("title",)}
    

    def get_tag(self, obj):
        tag = []
        for tags in obj.tag.all():
            tag.append(tags.title)
            return tag
        
    actions = ['blog_status_update']    

    def blog_status_update(self, request, queryset):
        queryset.update(status = True)



@admin.register(Category)
class CategoryAdmin(TranslationAdmin):
    fields = ['title']       


@admin.register(BlogTag)
class BlogTagAdmin(TranslationAdmin):
    fields = ['title', ]