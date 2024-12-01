from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('account/', include('coffee_backend.account.urls')),  # Ensure 'coffee_backend.account.urls' exists and is correctly defined
]

