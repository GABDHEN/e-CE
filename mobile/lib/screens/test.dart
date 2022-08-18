// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobile/classes/NavigationDrawer.dart';
import 'package:mobile/features/auth/models/userInfos.dart';
import 'package:mobile/screens/Authscreen.dart';
import 'package:mobile/screens/profil/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late SharedPreferences prefs;
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

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var alignment = MainAxisAlignment.start;
    var sizedbox = SizedBox(width: 75);
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: NewGradientAppBar(
          gradient:
              LinearGradient(colors: [Color(0xFFF39F86), Color(0xFFF9D976)]),

          // backgroundColor: Colors.orange,
          title: Text('Profil'),
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
        body: Column(
          children: [
            SizedBox(
              height: height / 3.5,
              child: Stack(
                children: [
                  SizedBox(
                    height: (height) / 5,
                    child: ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [Color(0xFFF9D976), Color(0xFFF39F86)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: height / 9,
                    width: width,
                    top: height / 6.999,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height / 9,
                          width: height / 9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                          ),
                          child: Icon(
                            Icons.person_outlined,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 2 * height / 4,
                child: Column(
                  children: [
                    Container(
                      /* color: Colors.orange,
            width: double.infinity,
            height: 200, */
                      //padding: EdgeInsets.only18op: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.apartment_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Codeagence
                                                          .toString()
                                                      .trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.person_pin_sharp,
                                                    color: Colors.green,
                                                  )
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Matricule!
                                                      .trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: Colors.yellow,
                                                  )
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Nom!.trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.person_outline,
                                                    color: Colors.orange,
                                                  )
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Prenom!.trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.mail_sharp,
                                                    color: Colors.blue,
                                                  )
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Email!.trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.black26,
                                        ))),
                                        child: Padding(
                                          padding: EdgeInsets.all(18.0),
                                          child: Row(
                                            mainAxisAlignment: alignment,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.phone_android,
                                                    color: Colors.green,
                                                  )
                                                ],
                                              ),
                                              sizedbox,
                                              Column(
                                                children: [
                                                  Text(userInfos.Telephone!
                                                      .trim())
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ],
                ),
              ),
            )
          ],
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
