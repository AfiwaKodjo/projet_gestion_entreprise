from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.

class Administrateur(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    mdp = models.CharField(max_length=25)
 
class Livreur(AbstractUser):
    nom = models.CharField(max_length=100, unique=True)
    #email = models.CharField(max_length=255)
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    password = models.CharField(max_length=255)
    
    USERNAME_FIELD='nom'
    REQUIRED_FIELDS=[]
    
 
class Client(models.Model):
    id=models.BigAutoField(auto_created=True, primary_key=True, serialize=False)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    refgps = models.CharField(max_length=15)
    telephone = models.CharField(max_length=15)
 
class Livraison(models.Model):
    heure_livraison = models.DateTimeField()
    lieu = models.CharField(max_length=125)
    montant = models.IntegerField()
    #client = models.ForeignKey(Client, on_delete=models.CASCADE)
    livreur = models.ForeignKey(Livreur, on_delete=models.CASCADE)

   
class Commande(models.Model):
    Client = models.ForeignKey(Client, on_delete=models.CASCADE)
    Livraison = models.ForeignKey(Livraison, on_delete=models.CASCADE)
    nbre_cmd = models.IntegerField()
    prix = models.IntegerField()
    date_cmd = models.DateTimeField()
    CHOICES=(
        ('en attente', 'en attente'),
        ('annulée', 'annulée'),
        ('en cours', 'en cours'),
        ('livrée', 'livrée'),
    )
    statut = models.CharField(null=False, blank=False, choices=CHOICES, default='En attente', max_length=30)
    REQUIRED_FIELDS=['client, statut']      
    
    
class Produits(models.Model):
    name = models.CharField(max_length=255)
    masse = models.IntegerField()
    qte = models.IntegerField() 
    date_add = models.DateTimeField(auto_now_add=True)
    price = models.DecimalField(max_digits=15, decimal_places=2)
    image = models.ImageField(upload_to='product')
    #client = models.ForeignKey(Client, on_delete=models.CASCADE)
    #livreur = models.ForeignKey(Livreur, on_delete=models.CASCADE)
    Commande = models.ForeignKey(Commande, on_delete=models.CASCADE)
    
"""
    @property
    def get_discount(self):
        return "%.2f"%(float(self.price)*0.5)
"""
    
class Approvisionnement(models.Model):
    QteAppro = models.IntegerField()
    Client = models.ForeignKey(Client, on_delete=models.CASCADE)
    
class LigneCommande(models.Model):
    #idLCmd = models.BigAutoField(auto_created=True, serialize=False)
    produits = models.ForeignKey(Produits, on_delete=models.CASCADE)
    commande = models.ForeignKey(Commande, on_delete=models.CASCADE)
    quantite = models.IntegerField()
    prix = models.FloatField()
    REQUIRED_FIELDS=['produits','quantite', 'prix']
    
"""class User(AbstractUser):
    nom = models.CharField(max_length=100)
    mdp = models.CharField(max_length=25, unique=True)
    
    REQUIRED_FIELDS=['nom','mdp']"""
