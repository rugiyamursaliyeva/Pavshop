from typing import Any
from django.db.models.query import QuerySet
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from blog.models import BlogPost, BlogTag, Category, CultureBlock, SideBacrBaner
from django.shortcuts import render, redirect
from django.urls import reverse_lazy, reverse
from django.contrib import messages
from django.views.generic import ListView, DetailView
from blog.forms import BlogCommentForm, SubBlogCommentForm
from django.views.generic.edit import FormMixin
# from django.core.paginator import Paginator paginate_by = 2 de istif. edilir
# # Create your views here.

def culture_view(request):
    culture_blocks = CultureBlock.objects.all() 
    context = {
         'culture_blocks': culture_blocks
    }
    return render(request, 'blog-list.html', context)



class BlogListView(ListView):
    model = BlogPost
    template_name = 'blog-list.html'
    context_object_name = 'blog_list'
    paginate_by = 3  # Sayfa başına 1 blog yazısı

    def get_queryset(self) -> QuerySet[Any]:
        queryset = super().get_queryset()
        category = self.request.GET.get('category')
        tag = self.request.GET.get('tag')
        search = self.request.GET.get('searched')
        if category:
            queryset = queryset.filter(category__id = category)
        if tag:
            queryset = queryset.filter(tag__id = tag)  
        if search:
            queryset = queryset.filter(title__icontains=search)      
        # if tag and category:
        #      queryset = queryset.filter(tag__id = tag, category__id = category)
        return queryset
     

    def get_context_data(self, **kwargs: Any):
        context = super().get_context_data(**kwargs)
        culture_blocks = CultureBlock.objects.all() 
        side_banners = SideBacrBaner.objects.all()
        context['side_banners'] = side_banners
        context['categories'] = Category.objects.all()
        context['culture_blocks'] = culture_blocks
        context['tag_list'] = BlogTag.objects.all()
        context['latest_blogs'] = BlogPost.objects.all().order_by("-created_at")[:3]
        return context


# def blog_list(request):
    # blogs = BlogPost.objects.all().order_by('created_at')
    # blogs = BlogPost.objects.all()
    # categories = Category.objects.all()
    # tags = BlogTag.objects.all()

    # category_counts = []
    # for category in categories:
    #     blog_count = category.blogs.count()  # Count the number of blogs in each category
    #     category_counts.append((category, blog_count))

    # context = {
    #     'blog_list': blogs,
    #     'categories': categories,  # Rename for clarity
    #     'tag_list': tags
    # }
    # return render(request, 'blog-list.html', context)




class BlogDetailView(DetailView, FormMixin):
    model = BlogPost
    template_name = 'blog-detail.html'
    form_class = BlogCommentForm 
    sub_form = SubBlogCommentForm

    def get_success_url(self) -> str:
         return reverse_lazy('blog:blog_detail-us', kwargs={'slug': self.object.slug})
    


    def get_context_data(self, **kwargs: Any):
           context = super().get_context_data(**kwargs)
           blog_detail = self.object
           culture_blocks = CultureBlock.objects.all() 
           side_banners = SideBacrBaner.objects.all()
           context['side_banners'] = side_banners
           context['culture_blocks'] = culture_blocks
           context['blog'] = blog_detail
           context['categories'] = Category.objects.all()
           context['tag_list'] = BlogTag.objects.all()
           context['latest_blogs'] = BlogPost.objects.all().order_by("-created_at")[:3]
           context['similar_blogs'] = BlogPost.objects.filter(category__id =blog_detail.category.id ).order_by("-created_at")[:2]
           return  context
    
    def post(self, request, *args, **kwargs):
        if 'parent' in self.request.POST:
             form = self.sub_form()
        # if 'parent' in self.request.POST:
        #      form = self.sub_form
        form = self.get_form()
        self.object = self.get_object()
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
        

    def form_valid(self, form: Any) -> HttpResponse:
            form.instance.parent_id = self.request.POST.get('parent', None)
            form.instance.user = self.request.user
            form.instance.blog = self.object
            form.save()
            return super().form_valid(form)    







    # def post(self, request, *args, **kwargs):
    #     self.object = self.get_object()
    #     blog_detail = self.object
    #     form = self.form_class(data=request.POST)
    #     if form.is_valid():
    #         comment = form.save(commit=False)
    #         comment.user = request.user  # Yorum yapan kullanıcıyı kaydet
    #         comment.blog = blog_detail  # Yorumun yapıldığı blogu kaydet
    #         comment.save()
    #         messages.add_message(request, messages.SUCCESS, "Your comment has been sent successfully. We thank you!")
    #         return redirect(reverse("blog:blog_detail-us", kwargs={'pk': blog_detail.pk}))
    #     else:
    #         context = self.get_context_data()
    #         context['form'] = form
    #         return self.render_to_response(context)
    
    # def form_valid(self, form: Any) -> HttpResponse:
    #       return super().form_valid(form)
    
    # def form_invalid(self, form: Any) -> HttpResponse:
    #       return super().form_invalid(form)






# Funsiya ile yazilan

# def blog_detail(request, pk):
#     blog_detail = get_object_or_404(BlogPost, id=pk)
#     categories = Category.objects.all()
#     tags = BlogTag.objects.all()
#     latest_blogs = BlogPost.objects.all().order_by("-created_at")[:3]
#     similar_blogs = BlogPost.objects.filter(category__id =blog_detail.category.id ).order_by("-created_at")[:2]
#     print(similar_blogs, "-------------")


    # form = BlogCommentForm()

    # if request.method == 'POST':
    #     form = BlogCommentForm(data=request.POST)
    #     if form.is_valid():
    #         comment = form.save(commit=False)
    #         comment.user = request.user  # Yorum yapan kullanıcıyı kaydet
    #         comment.blog = blog_detail  # Yorumun yapıldığı blogu kaydet
    #         comment.save()
    #         messages.add_message(request, messages.SUCCESS, "Your comment has been sent successfully. We thank you!")
    #         return redirect(reverse("blog:blog_detail-us", kwargs={'pk': pk}))


#     context = {
#         'blog' : blog_detail,
#         'categories': categories, 
#         'tag_list': tags,
#         "latest_blogs" : latest_blogs,
#         "similar_blogs":similar_blogs,
#         'form': form
#     }

#     return render(request, 'blog-detail.html', context)






