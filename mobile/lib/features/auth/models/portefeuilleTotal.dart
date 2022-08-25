// ignore_for_file: non_constant_identifier_names

class PortefeuilleTotal {
  final String? MATRICULE;
  final int? NUMERO_ENTREPRISE;
  final DateTime? DATE_AFFECTATION;
  final int? ANNEE_CONTROLE;
  final int? CODE_AGENCE;
  final String? CONS_PAR;
  final String? ORIGINE;

  PortefeuilleTotal({
    required this.MATRICULE,
    required this.NUMERO_ENTREPRISE,
    required this.DATE_AFFECTATION,
    required this.ANNEE_CONTROLE,
    required this.CODE_AGENCE,
    required this.CONS_PAR,
    required this.ORIGINE,
  });

  factory PortefeuilleTotal.fromJson(Map<String, dynamic> json) {
    return PortefeuilleTotal(
      MATRICULE: json['MATRICULE'] ?? "",
      NUMERO_ENTREPRISE: json['NUMERO_ENTREPRISE']
          ? int.parse(json['NUMERO_ENTREPRISE'])
          : null,
      DATE_AFFECTATION: json['DATE_AFFECTATION'] ?? "",
      ANNEE_CONTROLE:
          json['ANNEE_CONTROLE'] ? int.parse(json['ANNEE_CONTROLE']) : null,
      CODE_AGENCE: json['CODE_AGENCE'] ? int.parse(json['CODE_AGENCE']) : null,
      CONS_PAR: json['CONS_PAR'] ?? "",
      ORIGINE: json['ORIGINE'] ?? "",
    );
  }

  Map toJson() {
    return {
      "MATRICULE": MATRICULE,
      "NUMERO_ENTREPRISE": NUMERO_ENTREPRISE,
      "DATE_AFFECTATION": DATE_AFFECTATION,
      "ANNEE_CONTROLE": ANNEE_CONTROLE,
      "CODE_AGENCE": CODE_AGENCE,
      "CONS_PAR": CONS_PAR,
      "ORIGINE": ORIGINE,
    };
  }

  factory PortefeuilleTotal.fromJsonList2(List<dynamic> jsonList) {
    dynamic json = jsonList[0] as Map<String, dynamic>;
    return PortefeuilleTotal(
      MATRICULE: json['MATRICULE'] ?? "",
      NUMERO_ENTREPRISE: json['NUMERO_ENTREPRISE']
          ? int.parse(json['NUMERO_ENTREPRISE'])
          : null,
      DATE_AFFECTATION: json['DATE_AFFECTATION'] ?? "",
      ANNEE_CONTROLE:
          json['ANNEE_CONTROLE'] ? int.parse(json['ANNEE_CONTROLE']) : null,
      CODE_AGENCE: json['CODE_AGENCE'] ? int.parse(json['CODE_AGENCE']) : null,
      CONS_PAR: json['CONS_PAR'] ?? "",
      ORIGINE: json['ORIGINE'] ?? "",
    );
  }
}
