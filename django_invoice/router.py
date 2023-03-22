from fact_app.viewset import *
from rest_framework import routers


router=routers.DefaultRouter()
router.register('client', ClientViewsets)
router.register('livreur', LivreurViewsets)
router.register('produits', ProduitViewsets)
router.register('livraison', LivraisonViewsets)
router.register('administrateur', AdministrateurViewsets)
router.register('commande', CommandeViewsets)
router.register('categorie', CategorieViewsets)
router.register('ligneCommande', LigneCommandeViewsets)

