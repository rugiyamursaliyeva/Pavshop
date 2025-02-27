from django.db import models
from django.urls import reverse_lazy
from ckeditor.fields import RichTextField
from django.contrib.auth import get_user_model

User = get_user_model()
# Create your models here.

class AbstractModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Category(AbstractModel):
    title = models.CharField('title', max_length=150) 

    class Meta:
        verbose_name_plural = 'Categories'

    def __str__(self) -> str:
        return self.title



class BlogTag(AbstractModel):
    title = models.CharField('title', max_length=150)

    def __str__(self) -> str:
        return self.title
    
# class BlogImage(AbstractModel):
#     image = models.ImageField(upload_to='blogs/')
#     BlogPost = models.ForeignKey("Blog", related_name='images', on_delete=models.CASCADE)

#     def __str__(self) -> str:
#         return f"{self.product.title}'s image"    
    

class BlogPost(AbstractModel):
    title = models.CharField('title', max_length=255)
    image = models.ImageField(upload_to='blog_images/')
    tag = models.ManyToManyField(BlogTag, related_name='blogs')
    content = RichTextField()
    # description = models.CharField(max_length=255)
    category = models.ForeignKey('Category', related_name='blogs', on_delete=models.CASCADE)
    slug = models.SlugField('slug', null=True, blank=True)
    status = models.BooleanField(default=False)
    author = models.ForeignKey(User,related_name='blogs', on_delete=models.CASCADE)
    
    def author_name(self):
        return self.author.get_full_name() # serializerda author_name 
    

    def __str__(self) -> str:
        return self.title   


    def get_absolute_url(self):
        return reverse_lazy('blog:blog_detail-us', kwargs = {'slug' : self.slug}) 


class BlogComment(AbstractModel):
    parent = models.ForeignKey('self', related_name='children', null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(User, max_length=100, on_delete=models.CASCADE)
    blog = models.ForeignKey(BlogPost, max_length=100, on_delete=models.CASCADE)
    comments = models.TextField('text', max_length=225)

    def __str__(self) -> str:
        return f"{self.user} {self.blog} {self.id} comment"
    

class CultureBlock(models.Model):
    image = models.ImageField(upload_to='images/')
    def __str__(self):
        return f'Image {self.id}'
    


class SideBacrBaner(models.Model):
    image = models.ImageField(upload_to='images/')
    def __str__(self):
        return f'{self.image.name}'