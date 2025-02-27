from blog.models import BlogPost, Category, BlogTag
from django.http import JsonResponse
from blog.api.serializers import BlogCategorySerializer, BlogTagSerializer, BlogPostSerializer, BlogPostCreateSerializer
from rest_framework.decorators import api_view
from rest_framework.generics import ListAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView


# ListCreateAPIView for POST method
# RetrieveUpdateDestroyAPIView for PUT & PATCH and DELETE



class CategoryAPIView(ListCreateAPIView):
    serializer_class = BlogCategorySerializer
    queryset = Category.objects.all()

# def blogcategories(request):
#     category_lists = Category.objects.all()
#     serializer = CategorySerializer(category_lists, many = True)
#     return JsonResponse(serializer.data, safe=False)  




class BlogTagAPIView(ListAPIView):
    serializer_class = BlogTagSerializer
    queryset = BlogTag.objects.all()

# def blogtags(request):
#     tag_lists = BlogTag.objects.all()
#     serializer = BlogTagSerializer(tag_lists, many = True)
#     return JsonResponse(serializer.data, safe=False)



class BlogPostAPIView(ListCreateAPIView):
    serializer_class = BlogPostSerializer
    queryset = BlogPost.objects.all()

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return BlogPostCreateSerializer
        return self.serializer_class


# @api_view(['GET', 'POST'])
# def blogs(request):
#     if request.method == 'POST':
#         serializer = BlogPostCreateSerializer(data = request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return JsonResponse(serializer.data, safe=False, status = 201)
#         return JsonResponse(serializer.errors, safe=False, status = 400)
#     blog_list = BlogPost.objects.all()
#     serializer = BlogPostSerializer(blog_list, context = {'request':request}, many=True)
#     return JsonResponse(serializer.data, safe=False)





class BlogUpdateAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = BlogPostCreateSerializer
    queryset = BlogPost.objects.all()

# @api_view(['PUT', 'PATCH'])
# def blogs_update(request, pk):
#     if request.method == 'PUT':
#         blog = BlogPost.objects.get(id=pk)
#         serializer = BlogPostCreateSerializer(data = request.data, instance = blog)
#         if serializer.is_valid():
#             serializer.save()
#             return JsonResponse(serializer.data, safe=False, status = 201)
#         return JsonResponse(serializer.errors, safe=False, status = 400)
#     if request.method == 'PATCH':
#         blog = BlogPost.objects.get(id=pk)
#         serializer = BlogPostCreateSerializer(data = request.data, partial = True, instance = blog)
#         if serializer.is_valid():
#             serializer.save()
#             return JsonResponse(serializer.data, safe=False, status = 201)
#         return JsonResponse(serializer.errors, safe=False, status = 400)
#     return JsonResponse(serializer.data, safe=False)


