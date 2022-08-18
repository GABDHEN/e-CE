// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, unused_field, non_constant_identifier_names, unused_import, constant_identifier_names

import 'package:card_settings/card_settings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/test.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../classes/NavigationDrawer.dart';
import '../models/civilite_dirigeant.dart';
import '../models/civilite_signataire.dart';
import '../models/titre_dirigeant.dart';
import '../models/titre_signataire.dart';
import 'Authscreen.dart';
import 'profil/profil.dart';

class Avis_controle extends StatefulWidget {
  const Avis_controle({Key? key}) : super(key: key);

  @override
  State<Avis_controle> createState() => _Avis_controleState();
}

class _Avis_controleState extends State<Avis_controle> {
  DateTime date = DateTime.now();
  String? selectedtime;
  static const Cnpscolor = Colors.orange; //(0x00193c88);
  bool spinner = false;

  Future<void> displayTimeDialog() async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        selectedtime = time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /* String? dropdownvalue = "Listes des numéros CNPS des entreprises"; */
    /*  var items = ["Entnum1", "Entnum2", "Entnum3"]; */
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: NewGradientAppBar(
          gradient:
              LinearGradient(colors: [Color(0xFFde7c0f), Color(0xFFde7c0f)]),

          // backgroundColor: Colors.orange,
          title: Text('Avis De Contrôle'),
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
        body: Container(
          color: Color(0xFFffe4c4),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.topLeft,
          //     colors: [Color(0xFFF9D976), Color(0xFFF39F86)],
          //   ),
          // ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Text(
                "Infos du Contrôleur",
                style: TextStyle(fontSize: 24.0),
              ),
              Card(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Matricule",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "M1012",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Agence",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "Plateau",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Nom et Prénoms",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "Lesky ouohhh",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Text(
                "Rédaction d'avis ",
                style: TextStyle(fontSize: 24.0),
              ),
              Card(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Numéro de l'entreprise",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "147589",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Raison sociable",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "ENT 1413",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Effectif salarié",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "100",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Date affectation",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "12/07/2022",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Date retrait",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "_",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Date de passage",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${date.day}/${date.month}/${date.year}"),
                      trailing: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) {
                            return;
                          } else {
                            setState(() {
                              date = newDate;
                            });
                          }
                        },
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Heure de passage",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(selectedtime != null
                          ? '$selectedtime'
                          : "Selectionner l'heure svp"),
                      trailing: IconButton(
                        icon: Icon(Icons.punch_clock),
                        onPressed: displayTimeDialog,
                      ),
                      onTap: () {},
                    ),
                    civilite_signataire(),
                    SizedBox(height: 30),
                    titresignataire(),
                    SizedBox(height: 30),
                    civilite_dirigeant(),
                    SizedBox(height: 30),
                    titre_dirigeant(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Cnpscolor,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  shape: StadiumBorder(),
                  fixedSize: Size.fromHeight(55),
                ),
                child: spinner
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Valider Formulaire"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
