from django.urls import path

from RestAPI.views import RegisterView 
from .views import LivreurView, LoginView, LogoutView, RegisterView
urlpatterns = [
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('livreur', LivreurView.as_view()),
    path('logout', LogoutView.as_view()),


    
]