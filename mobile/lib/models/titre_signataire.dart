// ignore_for_file: non_constant_identifier_names, unused_field, camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class titresignataire extends StatefulWidget {
  titresignataire({Key? key}) : super(key: key);

  @override
  State<titresignataire> createState() => _titresignataireState();
}

class _titresignataireState extends State<titresignataire> {
  String? Dropdownvalue_Signataire;
  var items_signataire = [
    "Le Directeur",
    "L'Adjoint du Directeur",
    "Le Chef d'Agence",
    "Le Manager d'Agence",
    "Le Directeur par Interim",
    "La Directrice",
    "La Directrice par Interim"
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: const Text(
        'Selectionner la civilité du signataire',
        style: TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: items_signataire
          .map((items_signataire) => DropdownMenuItem<String>(
                value: items_signataire,
                child: Text(
                  items_signataire,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value_titre_signataire) {
        //Do something when changing the item if you want.
      },
      onSaved: (value_titre_signataire) {
        Dropdownvalue_Signataire = value_titre_signataire.toString();
      },
    );
  }
}
