import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:entreprise_essivi_sarl/accueilPage.dart';
import 'package:entreprise_essivi_sarl/favoritePage.dart';
import 'package:entreprise_essivi_sarl/formPage.dart';
import 'package:flutter/material.dart';

import 'DashboardPage.dart';
import 'commandePage.dart';
import 'localisationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Miabé eau',
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = const [
    Icon(
      Icons.favorite,
      size: 40,
      color: Colors.white,
    ),
    Icon(
      Icons.home,
      size: 40,
      color: Colors.white,
    ),
    Icon(Icons.person, size: 40, color: Colors.white),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 68, 94, 163),
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          index: index,
          color: Colors.indigo.shade600,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          height: 70,
          animationDuration: const Duration(milliseconds: 300),
        ),
        body: Container(
          color: Color.fromARGB(255, 41, 19, 165),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index),
        ));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const FavoritePage();
        break;
      case 1:
        widget = const AccueilPage();
        break;
      case 2:
        widget =  FormPage();
        break;
      default:
        widget = const AccueilPage();
    }
    return widget;
  }
}
