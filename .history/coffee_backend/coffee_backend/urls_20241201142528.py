
from django.contrib import admin
from django.urls import path, include

from coffee_backend.account import account
from .accounts import views # type: ignore




urlpatterns = [
    path('admin/', admin.site.urls),
    path('account/', account(), name='login'),
]
