from product.models import Category, Tag, Product
from core.models import Subscribe
from django.http import JsonResponse
from product.api.serializers import CategorySerializer, TagSerializer, ProductSerializer, ProductCreateSerializer, SubscribeSerializer
from rest_framework.decorators import api_view
from rest_framework.generics import ListAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView, CreateAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly


class SubscribeAPIView(CreateAPIView):
    serializer_class = SubscribeSerializer
    queryset = Subscribe.objects.all()



class CategoryAPIView(ListCreateAPIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()

# def categories(request):
#     category_lists = Category.objects.all()
#     # category_dict = []
#     # for category in category_lists:
#     #     category_dict.append({
#     #         'category-id': category.id,
#     #         'title': category.title
#     #     })
#     serializer = CategorySerializer(category_lists, many = True)
#     return JsonResponse(serializer.data, safe=False)  




class TagAPIView(ListCreateAPIView):
    serializer_class = TagSerializer
    queryset = Tag.objects.all()

# def tags(request):
#     tag_lists = Tag.objects.all()
#     serializer = TagSerializer(tag_lists, many = True)
#     return JsonResponse(serializer.data, safe=False)



class ProductAPIView(ListCreateAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = [IsAuthenticatedOrReadOnly]

    
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return ProductCreateSerializer
        return self.serializer_class


# @api_view(['GET', 'POST'])
# def products(request):
#     if request.method == 'POST':
#         serializer = ProductCreateSerializer(data = request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return JsonResponse(serializer.data, safe=False, status = 201)
#         return JsonResponse(serializer.errors, safe=False, status = 400)
#     product_lists = Product.objects.all()
#     serializer = ProductSerializer(product_lists, context = {'request':request}, many = True)
#     return JsonResponse(serializer.data, safe=False)


@api_view(['PUT', 'PATCH'])
def products_update(request, pk):
    if request.method == 'PUT':
        product = Product.objects.get(id=pk)
        serializer = ProductCreateSerializer(data = request.data, instance = product)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, safe=False, status = 201)
        return JsonResponse(serializer.errors, safe=False, status = 400)
    if request.method == 'PATCH':
        product = Product.objects.get(id=pk)
        serializer = ProductCreateSerializer(data = request.data, partial = True, instance = product)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, safe=False, status = 201)
        return JsonResponse(serializer.errors, safe=False, status = 400)
    return JsonResponse(serializer.data, safe=False)



class ProductUpdateView(RetrieveUpdateDestroyAPIView):
    serializer_class = ProductCreateSerializer
    queryset = Product.objects.all()
