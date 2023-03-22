from django.contrib import admin
from .models import * 
from django.utils.translation import gettext_lazy as _

# Register your models here.


class AdminClient(admin.ModelAdmin):
    list_display = ('id','nom', 'prenom', 'longitude','latitude','telephone')

class AdminLivreur(admin.ModelAdmin):
    list_display = ('nom', 'password') 
    
class AdminCommande(admin.ModelAdmin):
    list_display = ('nbre_cmd', 'client','prix','produit','statut')  
    
class AdminCategorie(admin.ModelAdmin):
    list_display = ('id','designation', 'poids') 
    
class AdminProduit(admin.ModelAdmin):
    list_display = ('id','nomProd', 'quantite','prix','image','categorie')

class AdminLigneCommande(admin.ModelAdmin):
    list_display = ('produits', 'commande','quantite','prix')
    
class AdminLivraison(admin.ModelAdmin):
    list_display = ('date_livraison', 'adresse','livreur','commande') 

admin.site.register(Client, AdminClient)
admin.site.register(Livreur, AdminLivreur)
admin.site.register(Commande, AdminCommande)
admin.site.register(Categorie, AdminCategorie)
admin.site.register(Produit, AdminProduit)
admin.site.register(LigneCommande, AdminLigneCommande)
admin.site.register(Livraison, AdminLivraison)




admin.site.site_title = _("Connexion")
admin.site.site_header = _("Dashboard Admin")
admin.site.index_title = _("Connexion")