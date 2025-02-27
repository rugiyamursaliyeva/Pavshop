from django import forms
from core.models import Contact
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _



class ContactForm(forms.ModelForm):

    class Meta:
        model = Contact
        fields = {
            'name',
            'email',
            'phone',
            'subject',
            'message'
        }

        widgets = {
            'name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Full Name')
            }),
            'email' : forms.EmailInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Email')
            }),
            'phone' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Phone')
            }),
            'subject' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Subject')
            }),
            'message' : forms.Textarea(attrs={
                'class' : 'form-control',
                'placeholder' : _('Messsage'),
                'rows' : 7,
                'cols' : 30
            })
        }    


    def clean_email(self):
        value = self.cleaned_data['email']
        if not value.endswith('gmail.com'):
            raise ValidationError('Email must be gmail.com!')
        return value
    
    def clean_name(self):
        value = self.cleaned_data['name']
        name = value.upper().strip()
        return name


