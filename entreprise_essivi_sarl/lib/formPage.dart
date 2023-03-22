// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'dashboardPage.dart';

/*class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Color.fromARGB(255, 21, 41, 219),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(
              height: 7,
            ),
            _inputField(
              "Nom d'utilisateur",
              nomController,
              autofocus: false,
            ),
            const SizedBox(
              height: 7,
            ),
            _inputField(
              "Mot de passe",
              mdpController,
              isMdp: true,
              autofocus: false,
            ),
            const SizedBox(
              height: 7,
            ),
            _loginBtn(),
            const SizedBox(
              height: 5,
            ),
            // _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 80),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isMdp = false, required Object autofocus}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isMdp,
    );
  }

  Connexion(String nom, String mdp) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {'nom': nom, 'mdp': mdp};
    var jsonresponce;
    var res =
        await http.post(Uri.parse("http://127.0.0.1:8000/api/livreur"),body: body);
    if (res.statusCode == 200) {
      jsonresponce = json.decode(res.body);
      print("responce statut ${res.statusCode}");
      print("responce statut ${res.body}");

      if (jsonresponce != null) {
        setState(() {
          _isLoading=false;
        });
        sharedPreferences.setString("jwt", jsonresponce["jwt"]);
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DashboardPage(),),);
    } else {
      setState(() {
        _isLoading =false;
      });
      print("responce statut ${res.body}");
    }
    }
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: nomController.text==""||mdpController.text==""?null :() {
        //debugPrint("Nom utilisateur: " + usernameController.text);
        //debugPrint("Mot de passe: " + passwordController.text);
        setState(() {
                       _isLoading=true;
                        });
        Connexion(nomController.text, mdpController.text);
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Connexion",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
*/
/*class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.teal,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                headerSection(),
                textSection(),
                buttonSection(),
              ],
            ),
    );
  }

  connexion(String nom, String mdp) async {
    Map data = {'nom': nom, 'mdp': mdp};
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/livreur"), body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage()),
            (Route<dynamic> route) => false);
      });
    } else {
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          connexion(nomController.text, mdpController.text);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          "Connexion",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          txtNom("Nom d'utilisateur", Icons.person),
          SizedBox(
            height: 30.0,
          ),
          txtMdp("Mot de passe", Icons.lock),
        ],
      ),
    );
  }

  TextEditingController nomController = new TextEditingController();
  TextEditingController mdpController = new TextEditingController();

  TextFormField txtNom(String title, IconData icon) {
    return TextFormField(
      controller: nomController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon)),
    );
  }

  TextFormField txtMdp(String title, IconData icon) {
    return TextFormField(
      controller: mdpController,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon)),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text(
        "Essivi-sarl",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
*/

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool is_loading = false;

  singin(String nom, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"nom": nom, "password": password};
    var jsonresponce;
    var res = await http.post(
        Uri.parse('https://34bb-102-64-223-243.eu.ngrok.io/api1/login'),
        body: body);
    if (res.statusCode == 200) {
      jsonresponce = json.decode(res.body);
      print("responce statut ${res.statusCode}");
      print("responce statut ${res.body}");

      if (jsonresponce != null) {
        /*setState(() {
          is_loading = false;
        });*/
        sharedPreferences.setString("jwt", jsonresponce["jwt"]);
        /*Navigator.of(context).push(MaterialPageRoute(
          builder: (_)=>DashboardPage(),),);*/
        Navigator.push(context, MaterialPageRoute(builder:(context) => const DashboardPage()),);
        //print('ok');
      }
    } else {
      setState(() {
        is_loading = false;
      });
      print("responce statut ${res.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.1);

    return Scaffold(
      /*body: Column(children: [
        SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Essivi',
                    style: TextStyle(
                      fontSize: 35,
                      color: Globalcolor().mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(children: [
                  Text(
                    'Connecter vous a votre compte',
                    style: TextStyle(
                      fontSize: 16,
                      color: Globalcolor().textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(height: 15),

                  ///email or username
                  TextFormGlobal(
                    controller: emailController,
                    text: "email ou nom d'utilisateur ",
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),

                  /// password
                  TextFormGlobal(
                    controller: passwordController,
                    text: "mot de passe ",
                    obscure: true,
                    textInputType: TextInputType.text,
                  ),

                  /// button
                  const SizedBox(height: 10),
                  const ButtonGlobal(),
                ])
              ],
            )),
          ),
        )
      ]
       */
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/image.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenue ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    //Image.asset('images/image.jpg' ,),
                    SizedBox(
                      height: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent.withAlpha(50),
                      ),
                      child: TextFormField(
                        controller: nomController,
                        cursorColor: Colors.blueAccent,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          hintText: "Nom d'utilisateur ",
                          border: InputBorder.none,
                        ),
                        obscureText: false,
                        validator: (nomController) {
                            if (nomController == null || nomController.isEmpty)
                                {return "Entrez un nom d'utilisateur valide!";}
                              return null;
                                },
                      ),
                    ),
                    SizedBox(height: 0.2),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent.withAlpha(50)),
                      child: TextFormField(
                        controller: passwordController,
                        cursorColor: Colors.blueAccent,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                          hintText: "Mot de passe ",
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                        validator: (value) {
                            if (value == null || value.isEmpty)
                                {return 'Entrez un mot de passe valide!';}
                              return null;
                                }
                      ),
                    ),
                    SizedBox(height: 9),
                    TextButton(
                      onPressed: nomController.text == "" ||
                              passwordController.text == ""
                          ? null
                          : () {
                              setState(() {
                                is_loading = true;
                              });
                              singin(
                                  nomController.text, passwordController.text);
                            },
                      child: Container(
                        width: size.width * 0.8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
