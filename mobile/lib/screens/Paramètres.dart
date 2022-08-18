// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mobile/screens/Authscreen.dart';
import 'package:mobile/screens/test.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../classes/NavigationDrawer.dart';

class Parametres extends StatefulWidget {
  Parametres({Key? key}) : super(key: key);

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: NewGradientAppBar(
          gradient:
              LinearGradient(colors: [Color(0xFFde7c0f), Color(0xFFde7c0f)]),

          // backgroundColor: Colors.orange,
          title: Text('Paramètres'),
          // titleTextStyle: TextStyle(
          //   color: Colors.white,
          //   fontSize: 25,
          // ),
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
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Test(),
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
        body: Center(
          child: Container(
            child: Text("Paramètres"),
          ),
        ),
      ),
    );
  }
}
