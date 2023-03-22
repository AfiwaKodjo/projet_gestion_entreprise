
from fact_app import models, serializer
from rest_framework import viewsets
#from . import models
#import serializers
#from . import serializers



class ClientViewsets(viewsets.ModelViewSet):
    queryset=models.Client.objects.all()
    serializer_class=serializer.ClientSerializer
    
class LivreurViewsets(viewsets.ModelViewSet):
    queryset=models.Livreur.objects.all()
    serializer_class=serializer.LivreurSerializer
    
    
class ProduitViewsets(viewsets.ModelViewSet):
    queryset=models.Produit.objects.all()
    serializer_class=serializer.ProduitSerializer
    
class LivraisonViewsets(viewsets.ModelViewSet):
    queryset=models.Livraison.objects.all()
    serializer_class=serializer.LivraisonSerializer

class CommandeViewsets(viewsets.ModelViewSet):
    queryset=models.Commande.objects.all()
    serializer_class=serializer.CommandeSerializer
    
class AdministrateurViewsets(viewsets.ModelViewSet):
    queryset=models.Administrateur.objects.all()
    serializer_class=serializer.AdministrateurSerializer
    
class CategorieViewsets(viewsets.ModelViewSet):
    queryset=models.Categorie.objects.all()
    serializer_class=serializer.CategorieSerializer
    
class LigneCommandeViewsets(viewsets.ModelViewSet):
    queryset=models.LigneCommande.objects.all()
    serializer_class=serializer.LigneCommandeSerializer   