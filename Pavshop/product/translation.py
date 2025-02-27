from modeltranslation.translator import translator, TranslationOptions
from product.models import Category, Tag, Product


class CategoryTranslationOptions(TranslationOptions):
    fields = ('title', )

translator.register(Category, CategoryTranslationOptions)


class TagTranslationOptions(TranslationOptions):
    fields = ('title', )

translator.register(Tag, TagTranslationOptions)    


class ProductTranslationOptions(TranslationOptions):
    fields = ('title', 'small_description', 'base_description', 'description')

translator.register(Product, ProductTranslationOptions) 



