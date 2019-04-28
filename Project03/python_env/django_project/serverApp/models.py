from django.db import models
from django.contrib.auth.models import User


class UserScore(models.Model):
    objects = models.Manager()
    score = models.IntegerField(default=0)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE, null=True)