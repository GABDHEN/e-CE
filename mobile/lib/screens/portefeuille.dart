// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mobile/classes/Cardslist.dart';
import 'package:mobile/models/portefeuilleItem.dart';

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
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.person),
            )
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
            // children: [
            //   Cardslist(),
            //   SizedBox(
            //     height: 20,
            //   ),
            //   Cardslist(),
            // ],
          ),
        ),
      ),
    );
  }
}
