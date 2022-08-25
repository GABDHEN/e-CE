// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, constant_identifier_names, unused_import, non_constant_identifier_names, unused_field
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobile/features/auth/models/portefeuilleTotal.dart';
import 'package:mobile/features/auth/services/auth.service.dart';
import 'package:mobile/features/auth/services/portefeuille.service.dart';
import 'package:mobile/screens/portefeuille.dart';
import 'package:mobile/test/backend_portefeuille.dart';
import 'package:shared_preferences/shared_preferences.dart';

//mport 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({Key? key}) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  late SharedPreferences prefs;
  late SharedPreferences prefs_porte;
  static const Cnpscolor = Colors.orange; //(0x00193c88);
  bool hiddenpwd = true;
  bool spinner = false;
  final AuthService _authservice = AuthService();
  final PortefeuilleService _portefeuilleService = PortefeuilleService();
  final userController = TextEditingController(/* text: "M1012" */);
  final pwdController = TextEditingController(text: "ZERTYUIOP");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Image(
                    image: AssetImage("assets/images/img2.jpeg"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("e-contrôle d'exploitation",
                    style: TextStyle(color: Colors.orange, fontSize: 25)),
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Matricule',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Saisir le Matricule';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: pwdController,
                          obscureText: hiddenpwd,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Mot de passe',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: _tooglepwdview,
                              child: Icon(Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Saisir le mot de passe';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Cnpscolor,
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                            shape: StadiumBorder(),
                            fixedSize: Size.fromHeight(55),
                          ),
                          child: spinner
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Connexion"),
                          onPressed: () {
                            if (_formKey.currentState!.validate() && !spinner) {
                              setState(() {
                                spinner = true;
                              });
                              _portefeuilleService
                                  .portefeuille(
                                login: userController.text,
                              )
                                  .then(
                                ((value) {
                                  //print(value);
                                  save_portefeuille(value);
                                }),
                              );
                              _authservice
                                  .authentication(
                                      login: userController.text,
                                      password: pwdController.text)
                                  .then((value) {
                                //print(value);
                                save(value);

                                setState(() {
                                  spinner = false;
                                });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Portefeuille(),
                                  ),
                                );
                              }).catchError(
                                (error) {
                                  setState(() {
                                    spinner = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())),
                                  );
                                },
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tooglepwdview() {
    if (hiddenpwd == true) {
      hiddenpwd = false;
    } else {
      hiddenpwd = true;
    }
    setState(() {});
  }

  save(data) async {
    prefs = await SharedPreferences.getInstance();
    //print("jsonEncode(data) ${jsonEncode(data)}");
    prefs.setString("infos", jsonEncode(data));
  }

  save_portefeuille(value) async {
    prefs_porte = await SharedPreferences.getInstance();
    //print("jsonEncode(data) ${jsonEncode(data)}");
    prefs_porte.setString("porte", jsonEncode(value));
  }
}
