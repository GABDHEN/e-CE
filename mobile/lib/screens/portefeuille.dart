// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_types_as_parameter_names
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:mobile/classes/Cardslist.dart';
import 'package:mobile/features/auth/models/portefeuilleTotal.dart';
//import 'package:mobile/models/portefeuilleItem.dart';
//import 'package:mobile/models/profilitem.dart';
import 'package:mobile/screens/Authscreen.dart';
//import 'package:mobile/screens/profil/profil.dart';
import 'package:mobile/screens/test.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/NavigationDrawer.dart';

class Portefeuille extends StatefulWidget {
  const Portefeuille({Key? key}) : super(key: key);

  @override
  State<Portefeuille> createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  late SharedPreferences prefs_porte;
  late PortefeuilleTotal portefeuilleTotal;

  // List<PortefeuilleItem> portefeuille = PortefeuilleItem.items();

  @override
  void initState() {
    retrieve().then(
      (value) {
        setState(
          () {
            portefeuilleTotal = value;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NewGradientAppBar(
          gradient:
              LinearGradient(colors: [Color(0xFFde7c0f), Color(0xFFde7c0f)]),

          // backgroundColor: Colors.orange,
          title: Text('Portefeuille Contrôleur'),
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
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
            child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.apartment_outlined),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(portefeuilleTotal.NUMERO_ENTREPRISE.toString()),
                    Text(
                      portefeuilleTotal.DATE_AFFECTATION.toString().trim(),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(portefeuilleTotal.CONS_PAR.toString().trim()),
                    IconButton(
                      icon: const Icon(Icons.edit_note_outlined),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Test(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future<PortefeuilleTotal> retrieve() async {
    prefs_porte = await SharedPreferences.getInstance();
    // var user = prefs_porte.getString("infos");
    // print("user $user");
    var temps = prefs_porte.getString("porte");
    print("temps $temps");
    var rese = jsonDecode(temps!);

    return PortefeuilleTotal.fromJson(rese);
  }
}
