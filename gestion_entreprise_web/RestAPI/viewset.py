
from RestAPI import models, serializer
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
    
    
class ProduitsViewsets(viewsets.ModelViewSet):
    queryset=models.Produits.objects.all()
    serializer_class=serializer.ProduitsSerializer
    
class LivraisonViewsets(viewsets.ModelViewSet):
    queryset=models.Livraison.objects.all()
    serializer_class=serializer.LivraisonSerializer

class CommandeViewsets(viewsets.ModelViewSet):
    queryset=models.Commande.objects.all()
    serializer_class=serializer.CommandeSerializer
    
class AdministrateurViewsets(viewsets.ModelViewSet):
    queryset=models.Administrateur.objects.all()
    serializer_class=serializer.AdministrateurSerializer
    
class ApprovisionnementViewsets(viewsets.ModelViewSet):
    queryset=models.Approvisionnement.objects.all()
    serializer_class=serializer.ApprovisionnementSerializer
    
class LigneCommandeViewsets(viewsets.ModelViewSet):
    queryset=models.Approvisionnement.objects.all()
    serializer_class=serializer.ApprovisionnementSerializer   