// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_local_variable, avoid_unnecessary_containers, avoid_print, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobile/features/auth/models/userInfos.dart';
//import 'package:mobile/screens/profil/widgets/profilcontaineritem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../classes/NavigationDrawer.dart';
import '../Authscreen.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late SharedPreferences prefs;
  late UserInfos userInfos;

  @override
  void initState() {
    super.initState();
    retrieve().then(
      (value) {
        setState(
          () {
            userInfos = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var taille_image = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Portefeuille Contrôleur'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            PopupMenuButton<int>(
              icon: Icon(Icons.person),
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text(
                        "Déconnexion",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
              offset: Offset(0, 60),
              color: Colors.grey,
              elevation: 2,
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profil(),
                    ),
                  );
                  // if value 2 show dialog
                } else if (value == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Authscreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        body: Container(
          /* color: Colors.orange,
          width: double.infinity,
          height: 200, */
          //padding: EdgeInsets.only18op: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 200,
                        color: Colors.orange,
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/personxy.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.apartment_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "CODE AGENCE",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      Text(userInfos.Codeagence.toString()
                                          .trim())
                                    ],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.person_pin_sharp,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "MATRICULE",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      Text(userInfos.Matricule!.trim())
                                    ],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "NOM",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [Text(userInfos.Nom!.trim())],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: Colors.orange,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "PRENOMS",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [Text(userInfos.Prenom!.trim())],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.mail_sharp,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "EMAIL",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [Text(userInfos.Email!.trim())],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ))),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                  // Column(
                                  //   // ignore: prefer_const_literals_to_create_immutables
                                  //   children: [
                                  //     Text(
                                  //       "TELEPHONNE",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      Text(userInfos.Telephone!.trim())
                                    ],
                                  ),
                                  Column(
                                    children: [Text("")],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserInfos> retrieve() async {
    prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString("infos");
    var res = jsonDecode(temp!);

    return UserInfos.fromJson(res);
  }
}
