from django.contrib import admin
from django.urls import path, include
from django.views import views  # Import views from your app



urlpatterns = [
    path('admin/', admin.site.urls),
    path('account/', include('coffee_backend.account.urls')),
]
