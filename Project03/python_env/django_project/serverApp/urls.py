from django.urls import include, path, re_path
from . import views
from django.http import HttpResponse


 

urlpatterns = [
    re_path(r'^$', views.main_game, name="main_game"),
    re_path(r'^jsongoeshere/$', views.jsongoeshere, name="jsongoeshere"),
]