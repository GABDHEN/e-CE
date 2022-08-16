// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:mobile/classes/Cardslist.dart';
import 'package:mobile/models/portefeuilleItem.dart';
import 'package:mobile/screens/Authscreen.dart';
import 'package:mobile/screens/profil/profil.dart';

import '../classes/NavigationDrawer.dart';

class Portefeuille extends StatefulWidget {
  const Portefeuille({Key? key}) : super(key: key);

  @override
  State<Portefeuille> createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  List<PortefeuilleItem> portefeuille = PortefeuilleItem.items();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: portefeuille
                .asMap()
                .entries
                .map((e) => Cardslist(
                      titre: e.value.RaisonSociale!,
                      soustitre: e.value.NumEntreprise!,
                      date: e.value.DateAffectation!,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
