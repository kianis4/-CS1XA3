from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse

urlpatterns = [
    path('e/kianis4/' , include('Lab07.urls')) ,
]
