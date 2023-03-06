from RestAPI.viewset import *
from rest_framework import routers


router=routers.DefaultRouter()
router.register('client', ClientViewsets)
router.register('livreur', LivreurViewsets)
router.register('produits', ProduitsViewsets)
router.register('livraison', LivraisonViewsets)
router.register('administrateur', AdministrateurViewsets)
router.register('commande', CommandeViewsets)
router.register('approvisionnement', ApprovisionnementViewsets)
router.register('LigneCommande', ApprovisionnementViewsets)

