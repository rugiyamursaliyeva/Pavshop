from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from accounts.forms import RegisterForm, LoginForm
from django.contrib import messages
from django.contrib.auth import authenticate, login as django_login, logout as django_logout
from django.contrib.auth.decorators import login_required
from .models import Country
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from accounts.tokens import account_activation_token
from django.forms import BaseModelForm
from django.http import HttpRequest, HttpResponse

from django.contrib.auth import get_user_model
User = get_user_model()
from django.utils.encoding import force_str
from django.utils.http import urlsafe_base64_decode
from django import forms
from django.contrib.auth.views import LoginView
# Create your views here.



def register(request):
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(data=request.POST)
        if form.is_valid():
            user = form.save(False)
            current_site = get_current_site(request)
            subject = 'Activate Your Account'
            message = render_to_string('account_activation_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            user.email_user(subject, message)
        
            # user.set_password(form.cleaned_data['password'])
            # messages.add_message(request, messages.SUCCESS, "Successfully sent!")
            # user.save()       
            return redirect(reverse_lazy('accounts:login'))
    context = {
        'form' : form
    }
    return render(request, 'register.html', context)




class UserLoginView(LoginView):
    template_name = 'login.html'
    form_class = LoginForm
    success_url = reverse_lazy('core:home')

    # def get_success_url(self):
        # return reverse_lazy('core:home')
    
    # def form_invalid(self, form: forms.ModelForm) -> HttpResponse:
    #     messages.add_message(self.request, messages.ERROR, "User not found!")
    #     return super().form_invalid(form)

    # def form_valid(self, form: BaseModelForm) -> HttpResponse:
    #     # messages.add_message(self.request, messages.SUCCESS, "Successfully sent!")
    #     return super().form_valid(form)





def login(request):
    next_url = request.GET.get('next', reverse_lazy('core:home'))
    form = LoginForm()
    if request.method == 'POST':
        form = LoginForm(data=request.POST)
        if form.is_valid():
            user = authenticate(
                request = request, 
                username=form.cleaned_data['username'], 
                password=form.cleaned_data['password']
            )
            if user:
                django_login(request, user)
                return redirect(next_url)
            else:
                messages.add_message(request, messages.ERROR, "User not found!")
            # return redirect("accounts:login")

    context = {
        'form' : form
    }
    return render(request, 'login.html', context)




@login_required(login_url='login')
def logout(request):
    django_logout(request)
    return redirect(reverse_lazy('accounts:login'))

# @login_required(login_url='login')
# def profile(request):
#     return render(request, 'user-profile.html')





def country_list(request):
    countries = Country.objects.all()
    context = {
        'countries': countries
    }
    return render(request, 'country_list.html', context)





def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        # django_login(request, user)
        return redirect('accounts:login')
    else:
        return render(request, 'account_activation_invalid.html')