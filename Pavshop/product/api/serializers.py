from rest_framework import serializers
from product.models import Category, Tag, Product
from core.models import Subscribe



class SubscribeSerializer(serializers.ModelSerializer):
    class Meta:
        model  = Subscribe
        fields = [
            'id',
            'email'
        ]


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = [
            'id',
            'title'
        ]

class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tag
        fields = [
            'id',
            'title'
        ]


class ProductSerializer(serializers.ModelSerializer):

    # category = serializers.CharField(source = 'category.title') #1 Category title 
    category = CategorySerializer() # id & title
    tag = TagSerializer(many = True) # id & title
 

    class Meta:
        model = Product
        fields = [
            'id',
            'title',
            'tag',
            'category',
            'description',
            'small_description',
            'cover_image',
            'price',
            'brand',
            'base_description',
            'color',
            'simple_facts'
        ]


class ProductCreateSerializer(serializers.ModelSerializer):


    class Meta:
        model = Product
        fields = [
            'id',
            'title',
            'tag',
            'category',
            'description',
            'small_description',
            'cover_image',
            'price',
            'brand',
            'base_description',
            'color',
            'simple_facts'
        ]      

