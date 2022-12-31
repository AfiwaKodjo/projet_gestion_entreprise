from datetime import datetime
from time import timezone
from django.db import models

    
status_choice= (('approved', 'APPROVED'),('pending', 'PENDING'), ('rejected', 'REJECTED'))
    
    
class Client(models.Model):
    nomClient = models.CharField(max_length=25)
    prenClient = models.CharField(max_length=30)
    tel = models.IntegerField()
    adresse=models.CharField(max_length=100)
    
class Vendeur(models.Model):
    nomVend = models.CharField(max_length=25)
    prenVend = models.CharField(max_length=30)
    tel = models.IntegerField(null=False)
    adresse = models.CharField(max_length=100)
    refDepot = models.CharField(max_length=100)
    qteDepot = models.IntegerField(null=False, default=0)
    montantPerçu = models.IntegerField(null=False, default=0)
    Date_heure_depot = models.DateTimeField(default=datetime.now)
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    
class Administrateur(models.Model):
    pseudoAdmin = models.CharField(max_length=30)
    adresse = models.CharField(max_length=100)
    tel = models.IntegerField(null=False)
    status = models.CharField(max_length=50, choices=status_choice, default='pending')   
    vendeur=models.ForeignKey(Vendeur, on_delete=models.CASCADE)