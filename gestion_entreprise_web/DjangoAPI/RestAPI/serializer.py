from rest_framework import serializers
from .models import *

class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields='__all__'


class LivreurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Livreur
        fields='__all__'
        extra_kwargs = {
            "password" : {"write_only": True}
        }



class ProduitsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produits
        fields='__all__'
        
class LivraisonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Livraison
        fields='__all__'

class CommandeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Commande
        fields='__all__'
        
class AdministrateurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Administrateur
        fields='__all__'
        
class ApprovisionnementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Approvisionnement
        fields='__all__'

class LigneCommandeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Approvisionnement
        fields='__all__'

