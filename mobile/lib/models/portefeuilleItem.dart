// ignore_for_file: non_constant_identifier_names

import 'dart:math';
// import 'package:intl/intl.dart';

class PortefeuilleItem {
  String? Matricule;
  String? RaisonSociale;
  String? NumEntreprise;
  String? DateAffectation;

  PortefeuilleItem({
    this.Matricule,
    this.RaisonSociale,
    this.NumEntreprise,
    this.DateAffectation,
  });

  static List<PortefeuilleItem> items() {
    return List.generate(
      10,
      (index) => PortefeuilleItem(
          Matricule: "M${Random().nextInt(1000)}",
          DateAffectation: DateTime.now().toIso8601String(),
          RaisonSociale: "ENT ${Random().nextInt(2022)}",
          NumEntreprise: Random().nextInt(202222).toString()),
      growable: true,
    );
  }
}
