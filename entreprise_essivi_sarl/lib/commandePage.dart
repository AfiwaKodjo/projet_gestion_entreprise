import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DashboardPage.dart';

/*class CommandePage extends StatelessWidget {
  const CommandePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommandePage(),
    );
  }
}*/

//vrai

class CommandePage extends StatefulWidget {
  /*CommandePage({super.key});*/
  const CommandePage({Key? key}) : super(key: key);
  @override
  State<CommandePage> createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  List<dynamic> commandes = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      ListeCommandes();
    });
  }

  Future<void> ListeCommandes() async {
    try {
      final response = await http.get(
          Uri.parse('https://34bb-102-64-223-243.eu.ngrok.io/api/commande/'));
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          commandes = responseBody;
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
                'C O M M A N D E S',
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
              itemCount: commandes.length,
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
                          'Quantité: ' +
                              commandes[index]['nbre_cmd'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          '  Client: ' +
                              commandes[index]['client'].toString(),
                          style: TextStyle(
                              color: Colors.black.withAlpha(180), fontSize: 16),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          ' Date commande: ' +
                              commandes[index]['date_cmd'].toString(),
                          style: TextStyle(
                              fontSize: 13, color: Colors.black.withAlpha(180)),
                        ),
                        Text(
                          ' Prix: ' + commandes[index]['prix'].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          ' Produits : ' +
                              commandes[index]['produit'].toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          ' Statut : ' + commandes[index]['statut'],
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


/*class CommandePage extends StatefulWidget {
  CommandePage({super.key});
  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  getCommandeData() async {
    var response = await http
        .get(Uri.https('https://192.168.42.190/api/commande', 'commande'));
    var jsonData = jsonDecode(response.body);
    List<Commande> commandes = [];

    for (var u in jsonData) {
      Commande commande = Commande(u['nbre_cmd'], u['prix'], u['date_cmd']);
      commandes.add(commande);
    }
    print(commandes.length);
    return commandes;
  }

  @override
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
              'C O M M A N D E S',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        drawer: const NavigationDrawer(),
        body: Container(
          child: Card(
              child: FutureBuilder(
                  future: getCommandeData(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text('Chargement...'),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(snapshot.data[i].['nbre_cmd']),
                              subtitle: Text(snapshot.data[i].prix),
                              trailing: Text(snapshot.data[i].date_cmd),
                            );
                          }
                          );
                    }
                  })),
        ),
      ),
    );
  }
}

class Commande {
  //final String client;
  final int nbre_cmd, prix;
  final DateTime date_cmd;

  Commande(this.nbre_cmd, this.prix, this.date_cmd);
}
*/