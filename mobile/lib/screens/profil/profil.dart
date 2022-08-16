// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_local_variable, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobile/features/auth/models/userInfos.dart';
import 'package:mobile/screens/profil/widgets/profilcontaineritem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../classes/NavigationDrawer.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late SharedPreferences prefs;
  String userController = ""; /* TextEditingController(/* text: "M1012" */) */
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
          title: Text('Profil'),
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
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.remove_red_eye),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("Profil", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
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
            ),
          ],
        ),
        body: Container(
          /* color: Colors.orange,
          width: double.infinity,
          height: 200, */
          //padding: EdgeInsets.only(top: 20.0),
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
                      height: 25,
                    ),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("Matricule"),
                            trailing: Text(userInfos.Matricule!),
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
