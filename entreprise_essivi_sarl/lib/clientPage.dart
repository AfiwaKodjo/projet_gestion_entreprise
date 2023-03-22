import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DashboardPage.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);
  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<dynamic> clients = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      ListeClients();
    });
  }

  Future<void> ListeClients() async {
    try {
      final response = await http.get(
          Uri.parse('https://34bb-102-64-223-243.eu.ngrok.io/api/client/'));
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          clients = responseBody;
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
                'N O S   C L I E N T S',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(137, 10, 9, 9),
                  fontWeight: FontWeight.w800,
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
              itemCount: clients.length,
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
                              clients[index]['id'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          '  Nom: ' +
                              clients[index]['nom'].toString(),
                          style: TextStyle(
                              color: Colors.black.withAlpha(180), fontSize: 16),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          ' Prenom: ' +
                              clients[index]['prenom'].toString(),
                          style: TextStyle(
                              fontSize: 13, color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          ' Longitude: ' + clients[index]['longitude'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Text(
                          ' Latitude: ' +
                              clients[index]['latitude'].toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          ' Telephone: ' + clients[index]['telephone'],
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


