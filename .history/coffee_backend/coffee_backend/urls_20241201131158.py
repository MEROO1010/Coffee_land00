
from django.contrib import admin
from django.urls import path, include

from coffee_backend.account import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('account/', views.account, name='account'),
]
