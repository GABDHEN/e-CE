// ignore_for_file: non_constant_identifier_names, unused_field, camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class civilite_signataire extends StatefulWidget {
  civilite_signataire({Key? key}) : super(key: key);

  @override
  State<civilite_signataire> createState() => _civilite_signataireState();
}

class _civilite_signataireState extends State<civilite_signataire> {
  String? DropdownValue;
  var items = ['Madame', 'Monsieur', 'Mademoiselle'];
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
      items: items
          .map((items) => DropdownMenuItem<String>(
                value: items,
                child: Text(
                  items,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        DropdownValue = value.toString();
      },
    );
  }
}
