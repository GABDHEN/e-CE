// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

class PortefeuilleItem {
  String? Matricule;
  int? NumeroEntreprise;
  DateTime? DateAffectation;
  int? AnneeControle;
  int? CodeAgence;
  String? ConsPar;
  String? Origine;

  PortefeuilleItem({
    this.Matricule,
    this.NumeroEntreprise,
    this.DateAffectation,
    this.AnneeControle,
    this.CodeAgence,
    this.ConsPar,
    this.Origine,
  });

  // static List<PortefeuilleItem> items() {
  //   return List.generate(
  //     10,
  //     (index) => PortefeuilleItem(
  //         Matricule: "M${Random().nextInt(1000)}",
  //         DateAffectation: DateTime.now().toIso8601String(),
  //         RaisonSociale: "ENT ${Random().nextInt(2022)}",
  //         NumEntreprise: Random().nextInt(202222).toString()),
  //     growable: true,
  //   );
  // }
  Future<String?> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? userController = prefs.getString('Matricule');
    return userController;
  }
}
