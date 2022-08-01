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
        body: Container(
            child: Center(
          child: Text("Avis de contrôle"),
        )),
      ),
    );
  }
}
