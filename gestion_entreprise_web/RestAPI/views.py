import datetime
import json
import jwt
from rest_framework.views import APIView
from django.shortcuts import render
from RestAPI.models import Livreur
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.response import Response
from RestAPI.serializers import LivreurSerializer
import livreur
from django.contrib.auth.hashers import check_password



class RegisterView(APIView):
    def post(self, request):
        serializer=LivreurSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
# Create your views here.

class LoginView(APIView):
    def post(self, request):
        nom=request.data['nom']
        password=request.data['password']
    
    
        livreur = Livreur.objects.filter(nom=nom).first()
        #livreur2 = Livreur.objects.filter(password=password).first()
    
        if livreur is None:
            raise AuthenticationFailed('Utilisateur n\'existe pas')
        
        if not livreur.check_password(password):
            raise AuthenticationFailed('Mot de passe incorrect')
            
        
        payload = {
            'id': livreur.id,
            'exp':datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat':datetime.datetime.utcnow()
        }
        
        token = jwt.encode(payload, 'secret', algorithm='HS256')
        
        response = Response()
            
        response.set_cookie(key='jwt', value=token,httponly=True)
        response.data = {
            'jwt':token
        }
        return response
    
class LivreurView(APIView):
    def get(self, request):
        token = request.COOKIES.get('jwt')
        
        if not token:
            raise AuthenticationFailed('Pas d\'authentification!')
        
        try:
            payload = jwt.decode(token, 'secret', algorithms=['HS256'])
            
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('Pas d\'authentification!')

        livreur = Livreur.objects.filter(id=payload['id']).first()
        serializer = LivreurSerializer(livreur)
        
        return Response(serializer.data)
        
        
        
class LogoutView(APIView):
    def post(self, request):
        response = Response()
        response.delete_cookie('jwt')     
        response.data = {
            'message':'succès'
        } 
        return response

"""from rest_framework.views import APIView
from .serializers import LivreurSerializer
from rest_framework.response import Response

from livreur.serializers import LivreurSerializer

# Create your views here.
class RegisterView(APIView):
    def post(self, request):
        serializer=LivreurSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
        """