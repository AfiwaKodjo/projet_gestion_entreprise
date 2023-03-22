import 'package:entreprise_essivi_sarl/commandePage.dart';
import 'package:entreprise_essivi_sarl/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import 'DashboardPage.dart';

class LocalisationPage extends StatefulWidget {
  const LocalisationPage ({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<LocalisationPage> createState() => _LocalisationPageState();
}

class _LocalisationPageState extends State<LocalisationPage> {

  String address = '';
  String longitude = '';
  String latitude = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Localisation'),
        ),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Center(child: Text(address)),
              ),
              SizedBox(
                height: 500,
                child: OpenStreetMapSearchAndPick(
                  center: LatLong(23, 89),
                  buttonColor: Colors.blue,
                  buttonText: 'Choisir l\'emplacement courant',
                  onPicked: (pickedData) {
                    setState(() {
                      address = pickedData.address;
                      longitude = pickedData.latLong.longitude as String;
                      latitude = pickedData.latLong.latitude as String;
                    });
                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
