from django import forms
from blog.models import BlogComment


class BlogCommentForm(forms.ModelForm):

    class Meta:
        model = BlogComment
        fields = {
            'comments'
        }

        widgets = {
            'comments' : forms.Textarea(attrs={
                'class' : 'form-control',
                'placeholder' : 'Comments',
                'rows' : 7,
                'cols' : 30
            })
        }


class SubBlogCommentForm(forms.ModelForm):

    class Meta:
        model = BlogComment
        fields = {
            'comments'
        }

        widgets = {
            'comments' : forms.Textarea(attrs={
                'class' : 'form-control',
                'placeholder' : 'Comments',
                'rows' : 7,
                'cols' : 30
            })
        }        
        