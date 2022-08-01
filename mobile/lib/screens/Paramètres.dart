// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Paramètres'),
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
        body: Center(
          child: Container(
            child: Text("Paramètres"),
          ),
        ),
      ),
    );
  }
}
