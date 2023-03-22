import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DashboardPage.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key}) : super(key: key);
  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      ListeCategories();
    });
  }

  Future<void> ListeCategories() async {
    try {
      final response = await http.get(
          Uri.parse('https://34bb-102-64-223-243.eu.ngrok.io/api/categorie/'));
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          categories = responseBody;
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
                'C A T E G O R I E S',
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
              itemCount: categories.length,
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
                          'Id catégorie: ' +
                              categories[index]['id'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          '  Désignation: ' +
                              categories[index]['designation'].toString(),
                          style: TextStyle(
                              color: Colors.black.withAlpha(180), fontSize: 16),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          ' Poids: ' +
                              categories[index]['poids'].toString()+'l',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black.withAlpha(180)),
                        ),
                        /*Text(
                          ' Prix: ' + categories[index]['prix'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          ' Produits : ' +
                              categories[index]['produit'].toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          ' Statut : ' + categories[index]['statut'],
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(137, 34, 31, 31)),
                        ),
                       */
                        
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


