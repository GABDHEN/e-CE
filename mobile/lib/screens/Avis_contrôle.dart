// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

import '../classes/NavigationDrawer.dart';

class Avis_controle extends StatefulWidget {
  const Avis_controle({Key? key}) : super(key: key);

  @override
  State<Avis_controle> createState() => _Avis_controleState();
}

class _Avis_controleState extends State<Avis_controle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Avis de contrôle'),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 27, 25, 25),
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
        body: SingleChildScrollView(
          child: Form(
            child: CardSettings(
              children: [
                CardSettingsSection(
                  header: CardSettingsHeader(
                    label: "Avis de Contrôle programme",
                    labelAlign: TextAlign.center,
                    color: Colors.blue[900],
                  ),
                  children: [
                    CardSettingsHeader(
                      label: "Infos Contrôleur",
                      labelAlign: TextAlign.left,
                    ),
                    CardSettingsText(
                      label: "Matricule Contrôleur",
                    ),
                    CardSettingsText(
                      label: "Agence",
                    ),
                    CardSettingsText(
                      label: "Nom et Prénoms du contrôleur",
                    ),
                    CardSettingsHeader(
                      label: "Rédaction d'avis pour employeur",
                    ),
                    /*  CardSettingsListPicker(
                      label: "Numéro entreprise",
                      items: [
                        Container(
                          child: Text("Ouohhh"),
                        )
                      ],
                    ), */
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
