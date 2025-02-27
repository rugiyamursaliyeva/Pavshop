from django import forms
from product.models import Review


class ReviewForm(forms.ModelForm):

    class Meta:
        model = Review
        fields = {
            'message'
        }

        widgets = {
            'message' : forms.Textarea(attrs={
                'class' : 'form-control',
                'placeholder' : 'Message',
                'rows' : 7,
                'cols' : 30
            })
        }

class AddToCartForm(forms.Form):
    quantity = forms.IntegerField(min_value=1, initial=1, widget=forms.NumberInput(attrs={
        'style': 'width: 100px; padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px;',
    }))