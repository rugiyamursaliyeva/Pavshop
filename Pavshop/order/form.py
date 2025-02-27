from django import forms
from order.models import BillingDetails


class BillingDetailstForm(forms.ModelForm):

    class Meta:
        model = BillingDetails
        fields = {
            'first_name',
            'last_name',
            'company_name',
            'address',
            'city',
            'country',
            'email',
            'phone'
        }

        widgets = {
            'first_name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'First Name'
            }),
            'last_name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Last Name'
            }),
            'company_name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Company Name'
            }),
            'country' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Country'
            }),
            'address' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Address'
            }),
            'city' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'City'
            }),
             'email' : forms.EmailInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Email'
            }),
            'phone' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : 'Phone'
            }),
            
            }
        






# class ShippingInfoForm(forms.ModelForm):

#     class Meta:
#         model = ShippingInfo
#         fields = {
#             'first_name',
#             'last_name',
#             'company_name',
#             'address',
#             'city',
#             'country',
#             'email',
#             'phone'
#         }

#         widgets = {
#             'first_name' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'First Name'
#             }),
#             'last_name' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Last Name'
#             }),
#             'company_name' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Company Name'
#             }),
#             'country' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Country'
#             }),
#             'address' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Address'
#             }),
#             'city' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'City'
#             }),
#              'email' : forms.EmailInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Email'
#             }),
#             'phone' : forms.TextInput(attrs={
#                 'class' : 'form-control',
#                 'placeholder' : 'Phone'
#             }),
            
#             }        