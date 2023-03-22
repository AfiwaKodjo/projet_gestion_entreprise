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



class ProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produit
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
        
class LigneCommandeSerializer(serializers.ModelSerializer):
    class Meta:
        model = LigneCommande
        fields='__all__'

class CategorieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categorie
        fields='__all__'

