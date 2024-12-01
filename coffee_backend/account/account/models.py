from django.db import models
from django.contrib.auth.models import AbstractUser

# Example custom user model (optional)
class CustomUser(AbstractUser):
    phone_number = models.CharField(max_length=15, blank=True, null=True)

# Example UserProfile model
class UserProfile(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    bio = models.TextField(blank=True, null=True)
    profile_image = models.ImageField(upload_to='profile_images/', blank=True, null=True)

    def __str__(self):
        return self.user.username
