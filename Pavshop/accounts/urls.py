from django.urls import path, re_path
from accounts.views import register, UserLoginView, country_list, activate, logout, login

app_name = "accounts"

urlpatterns = [
    path('register/', register, name= 'register_us'),
    path('login/', login, name='login'),
    # path('login/', UserLoginView.as_view(), name= 'login_us'),
    path('logout/', logout, name= 'logout'),
    path('countries/', country_list, name='country_list'),
    re_path(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,32})/$',
        activate, name='activate'),
]


