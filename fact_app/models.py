   
# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class Administrateur(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    mot_passe = models.CharField(max_length=25)
    

class Client(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    longitude = models.FloatField()
    latitude = models.FloatField()
    telephone = models.CharField(max_length=15)
    
  
class Livreur(AbstractUser):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nom = models.CharField(max_length=100)
    password = models.CharField(max_length=255)
    
    USERNAME_FIELD='username'
    REQUIRED_FIELDS=[]        
    

class Categorie(models.Model):
    designation = models.CharField(max_length=100)
    poids = models.FloatField()
    
class Produit(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nomProd = models.CharField(max_length=255)
    quantite = models.IntegerField() 
    prix = models.DecimalField(max_digits=15, decimal_places=2)
    image = models.ImageField(upload_to='product')
    #commande = models.ForeignKey(Commande, on_delete=models.CASCADE) 
    categorie = models.ForeignKey(Categorie, on_delete=models.CASCADE)
  
    
class Commande(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nbre_cmd = models.IntegerField()
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    prix = models.IntegerField()
    date_cmd = models.DateTimeField(auto_now=True)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)  
    CHOICES=(
        ('en attente', 'en attente'),
        ('annulée', 'annulée'),
        ('en cours', 'en cours'),
        ('livrée', 'livrée'),
    )
    statut = models.CharField(null=False, blank=False, choices=CHOICES, default='En attente', max_length=30)
    REQUIRED_FIELDS=['client, statut']
    
    
class Livraison(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    date_livraison = models.DateTimeField()
    adresse = models.CharField(max_length=125)
    livreur = models.ForeignKey(Livreur, on_delete=models.CASCADE)
    commande = models.ForeignKey(Commande, on_delete=models.CASCADE)  
   
    

    
"""class Approvisionnement(models.Model):
    QteAppro = models.IntegerField()
    Client = models.ForeignKey(Client, on_delete=models.CASCADE)"""
    
class LigneCommande(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    produits = models.ForeignKey(Produit, on_delete=models.CASCADE)
    commande = models.ForeignKey(Commande, on_delete=models.CASCADE)
    quantite = models.IntegerField()
    prix = models.IntegerField()
    REQUIRED_FIELDS=['produits','quantite', 'prix']
    



