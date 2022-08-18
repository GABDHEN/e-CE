// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/screens/Avis_contr%C3%B4le.dart';
import 'package:mobile/screens/Param%C3%A8tres.dart';
import 'package:mobile/screens/portefeuille.dart';

class Drawer_list extends StatefulWidget {
  Drawer_list({Key? key}) : super(key: key);

  @override
  State<Drawer_list> createState() => _Drawer_listState();
}

class _Drawer_listState extends State<Drawer_list> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            leading: Icon(Icons.document_scanner_outlined),
            title: Text("Portefeuille Contrôleur"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Portefeuille(),
                ),
              );
            },
            /*    selected: true,
            selectedColor: Colors.orange, */
          ),
          ListTile(
            leading: Icon(Icons.edit_note_outlined),
            title: Text("Avis de contrôle"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Avis_controle(),
                ),
              );
            },
          ),
          Divider(color: Colors.black54),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Paramètres"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Parametres(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
