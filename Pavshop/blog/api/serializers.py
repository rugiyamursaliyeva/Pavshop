from rest_framework import serializers
from blog.models import Category, BlogTag, BlogPost

class BlogCategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = [
            'id',
            'title'
        ]

class BlogTagSerializer(serializers.ModelSerializer):

    class Meta:
        model = BlogTag
        fields = [
            'id',
            'title'
        ]


class BlogPostSerializer(serializers.ModelSerializer):

    # category = serializers.CharField(source = 'category.title') #1 Category title 
    category = BlogCategorySerializer() # id & title
    tag = BlogTagSerializer(many = True) # id & title (many to many ile baglandigina gore 'many = True' yazilisindan istif. olunur.)
 

    class Meta:
        model = BlogPost
        fields = [
            'id',
            'title',
            'tag',
            'category',
            'content',
            'image',
            'author_name'
        ]


class BlogPostCreateSerializer(serializers.ModelSerializer):

    author = serializers.PrimaryKeyRelatedField(read_only = True)


    class Meta:
        model = BlogPost
        fields = [
            'id',
            'title',
            'tag',
            'category',
            'content',
            'image',
            'author'
        ]     

        
    def validate(self, attrs):
        request = self.context['request']
        attrs['author'] = request.user
        return super().validate(attrs)         