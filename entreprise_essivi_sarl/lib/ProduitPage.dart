import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DashboardPage.dart';


class ProduitPage extends StatefulWidget {
  const ProduitPage({Key? key}) : super(key: key);
  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {
  List<dynamic> produits = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      ListeProduits();
    });
  }

  Future<void> ListeProduits() async {
    try {
      final response = await http.get(
          Uri.parse('https://34bb-102-64-223-243.eu.ngrok.io/api/produit/'));
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          produits = responseBody;
        });
      }
    } catch (e) {
      print('a revoir');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueAccent.withAlpha(20),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: Border(
                bottom: BorderSide(
              color: Colors.grey.withAlpha(60),
            )),
            title: Center(
              child: Text(
                'N O S  P R O D U I T S',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          drawer: const NavigationDrawer(),
          body: Container(
            child: ListView.builder(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: produits.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('CLIQUEZ ICI');
                  },
                  child: Container(
                    width: 250,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 12, right: 3, left: 3),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(60),
                            spreadRadius: 0.5,
                            blurRadius: 3,
                            offset: const Offset(0, 0) //color of shadow
                            ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Id produit: ' +
                              produits[index]['id'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          '  Nom du produit: ' +
                              produits[index]['nomProd'].toString(),
                          style: TextStyle(
                              color: Colors.black.withAlpha(180), fontSize: 16),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          ' Quantité: ' +
                              produits[index]['quantite'].toString(),
                          style: TextStyle(
                              fontSize: 13, color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          ' Prix: ' + produits[index]['prix'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          ' Image : ' +
                              produits[index]['image'].toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          ' Categorie : ' + produits[index]['categorie'],
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(137, 34, 31, 31)),
                        ),
                       
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}


