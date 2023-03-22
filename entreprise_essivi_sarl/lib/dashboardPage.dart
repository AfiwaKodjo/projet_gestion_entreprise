import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LivraisonPage.dart';
import 'ProduitPage.dart';
import 'categoriePage.dart';
import 'clientPage.dart';
import 'commandePage.dart';
import 'formPage.dart';
import 'localisationPage.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Dashboard'),
      backgroundColor: Colors.blue.shade700,
    ),
    drawer: const NavigationDrawer(),

body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/image1.webp"), fit: BoxFit.cover)),
        child: Center(
            child: Text(
          "Bienvenue cher livreur",
          style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        )),
      ),

  );

}


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) => Drawer(

  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildHeader(context),
        buildMenuItems(context),

      ],
    )
    ),
 );

 Widget buildHeader(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
 );

Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(6),
  child: Wrap(
    runSpacing: 4, 
  children: [
    ListTile(
      leading: const Icon(Icons.add_shopping_cart),
      title: const Text('Commande'),
      onTap: () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>CommandePage(),
          )),
        
      
    ),

    ListTile(
      leading: const Icon(Icons.bike_scooter),
      title: const Text('Livraison'),
      onTap: () {
        //Fermer la navigation drawer avant
      Navigator.pop(context);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LivraisonPage(),
        ),

        );
  
      },
    ),

    ListTile(
      leading: const Icon(Icons.person),
      title: const Text('Clients'),
      onTap: () {
        //Fermer la navigation drawer avant
      Navigator.pop(context);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ClientPage(),
        ),
        
        );
  
      },
    ),

    ListTile(
      leading: const Icon(Icons.production_quantity_limits),
      title: const Text('Produits'),
      onTap: () {
        //Fermer la navigation drawer avant
      Navigator.pop(context);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProduitPage(),
        ),
        
        );
  
      },
    ),

     ListTile(
      leading: const Icon(Icons.category),
      title: const Text('Categories'),
      onTap: () {
        //Fermer la navigation drawer avant
      Navigator.pop(context);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoriePage(),
        ),
        
        );
  
      },
    ),
  
     ListTile(
      leading: const Icon(Icons.map),
      title: const Text('Map'),
      onTap: () {
        //Fermer la navigation drawer avant
      Navigator.pop(context);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>LocalisationPage(title: 'Localisation',),
        ),
        
        );
  
      },
    )

    ],
  ),

  
);


     
    

    }

  
 

