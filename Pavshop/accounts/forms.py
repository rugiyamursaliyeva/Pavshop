from typing import Any
from django import forms
from django.core.exceptions import ValidationError
from django.contrib.auth import get_user_model
User = get_user_model()
from .models import Country
from django.contrib.auth.forms import AuthenticationForm, UsernameField
from django.utils.translation import gettext_lazy as _


class LoginForm(AuthenticationForm):
    username = UsernameField(max_length=100, widget=forms.TextInput(attrs={
        'class' : 'form-control',
        'placeholder' : 'Username'
    }))
    password = forms.CharField(max_length=200, widget=forms.PasswordInput(attrs={
        'class' : 'form-control',
        'placeholder' : 'Password'
    }))


class LoginForm(AuthenticationForm):
    username = UsernameField(max_length=100, widget=forms.TextInput(attrs={
        'class' : 'form-control',
        'placeholder' : 'Username'
    }))
    password = forms.CharField(max_length=200, widget=forms.PasswordInput(attrs={
        'class' : 'form-control',
        'placeholder' : 'Password'
    }))





class RegisterForm(forms.ModelForm):
    confirm_password = forms.CharField(max_length=100, widget=forms.PasswordInput(attrs={
        'class' : 'form-control',
        'placeholder' : _('Confirm Password')
    }))
    
    country = forms.ModelChoiceField(
        queryset = Country.objects.all(),  # Ülkeleri listele
        widget = forms.Select(attrs={
            'class': 'form-control',
            'placeholder': 'Select Country'
        })
    )


    class Meta:
        model = User
        fields = {
            'first_name',
            'last_name',
            'username',
            'email',
            'address',
            'city',
            'phone',
            'password',
            # 'country'
            
        }
        widgets = {
            'first_name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('First Name')
            }),
            'username' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Username')
            }),
            'last_name' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Last Name')
            }),
            'email' : forms.EmailInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Email')
            }),
            'address' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Address')
            }),
            'city' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('City')
            }),
            'phone' : forms.TextInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Phone')
            }),
             'password' : forms.PasswordInput(attrs={
                'class' : 'form-control',
                'placeholder' : _('Password')
            }),
            }
        

    def clean_email(self):
        value = self.cleaned_data['email']
        if not value.endswith('gmail.com'):
            raise ValidationError('Email must be gmail.com!')
        return value   
       

    def save(self, commit: bool = ...) -> Any:
        user = super().save(commit)
        user.set_password(self.cleaned_data['password'])
        user.is_active = False
        user.save()
        return user
    

    def clean(self) -> dict[str, Any]:
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise ValidationError('Passwords must be same!')
        return 

