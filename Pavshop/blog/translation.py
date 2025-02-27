from modeltranslation.translator import translator, TranslationOptions
from blog.models import Category, BlogTag, BlogPost

class CategoryTranslationOptions(TranslationOptions):
    fields = ('title', )

translator.register(Category, CategoryTranslationOptions)   


class BlogTagTranslationOptions(TranslationOptions):
    fields = ('title', )

translator.register(BlogTag, BlogTagTranslationOptions) 


class BlogPostTranslationOptions(TranslationOptions):
    fields = ('title', 'content')

translator.register(BlogPost, BlogPostTranslationOptions) 
