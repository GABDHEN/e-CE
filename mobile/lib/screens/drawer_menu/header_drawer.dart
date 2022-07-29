// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';

class Header_drawer extends StatefulWidget {
  const Header_drawer({Key? key}) : super(key: key);

  @override
  State<Header_drawer> createState() => _Header_drawerState();
}

class _Header_drawerState extends State<Header_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/icons.png"))),
          ),
          Text("Contrôleur d'exploitation",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("michelahoba67@gmail.com",
              style: TextStyle(color: Colors.greenAccent, fontSize: 14)),
        ],
      ),
    );
  }
}
