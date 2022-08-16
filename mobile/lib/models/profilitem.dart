// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class profilitem {
  String? MATRICULE;
  String? CODE_AGENCE;
  String? LIBELLE_FONCTION;
  String? NOM;
  String? PRENOM;
  String? EMAIL;
  String? TELEPHONNE_AGENT;

  profilitem({
    this.MATRICULE,
    this.CODE_AGENCE,
    this.LIBELLE_FONCTION,
    this.NOM,
    this.PRENOM,
    this.EMAIL,
    this.TELEPHONNE_AGENT,
  });

  Future<String?> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? userController = prefs.getString('Matricule');
    return userController;
  }
}
