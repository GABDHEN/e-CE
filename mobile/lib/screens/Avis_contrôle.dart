// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps
import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

import '../classes/NavigationDrawer.dart';

class Avis_controle extends StatefulWidget {
  const Avis_controle({Key? key}) : super(key: key);

  @override
  State<Avis_controle> createState() => _Avis_controleState();
}

class _Avis_controleState extends State<Avis_controle> {
  DateTime date = DateTime.now();
  String? selectedtime;
  String dropdownValue = "Civilité du Signataire";

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
    String? dropdownvalue = "Listes des numéros CNPS des entreprises";
    var items = ["Entnum1", "Entnum2", "Entnum3"];
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Avis de contrôle'),
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
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [Color(0xFF6FC3F7), Color(0xFFC2FDFF)])),
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
                        "Matricule du contrôleur",
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
                        "Nom et Prénoms du contrôleur",
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
                          : "Selectionner l'heure' svp"),
                      trailing: IconButton(
                        icon: Icon(Icons.punch_clock),
                        onPressed: displayTimeDialog,
                      ),
                      onTap: () {},
                    ),
                    /*  DropdownButton(
                      value: dropdownvalue,
                      items: [
                        'Madame',
                        'Monsieur',
                        'Mademoiselle',
                      ].map<DropdownMenuItem>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ), */
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
