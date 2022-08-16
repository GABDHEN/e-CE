// ignore_for_file: non_constant_identifier_names

class UserInfos {
  final String? Matricule;
  final int Codeagence;
  final String? Fonction;
  final String? Nom;
  final String? Prenom;
  final String? Email;
  final String? Telephone;

  UserInfos({
    required this.Matricule,
    required this.Codeagence,
    required this.Fonction,
    required this.Nom,
    required this.Prenom,
    required this.Email,
    required this.Telephone,
  });

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    return UserInfos(
        Matricule: json['MATRICULE'] ?? "",
        Codeagence: json['CODE_AGENCE'] ?? "",
        Fonction: json['LIBELLE_FONCTION_'] ?? "",
        Nom: json['NOM'] ?? "",
        Prenom: json['PRENOM'] ?? "",
        Email: json['EMAIL'] ?? "",
        Telephone: json['TELEPHONE_AGENT'] ?? "");
  }

  Map toJson() {
    return {
      "MATRICULE": Matricule,
      "CODE_AGENCE": Codeagence,
      "LIBELLE_FONCTION_": Fonction,
      "NOM": Nom,
      "PRENOM": Prenom,
      "EMAIL": Email,
      "TELEPHONE_AGENT": Telephone
    };
  }

  factory UserInfos.fromJsonList2(List<dynamic> jsonList) {
    // List<UserInfos> list = List<UserInfos>.from(jsonList);
    dynamic json = jsonList[0] as Map<String, dynamic>;

    return UserInfos(
      Matricule: json['MATRICULE'],
      Codeagence: json['CODE_AGENCE'],
      Fonction: json['LIBELLE_FONCTION_'],
      Nom: json['NOM'],
      Prenom: json['PRENOM'],
      Email: json['EMAIL'],
      Telephone: json['TELEPHONE_AGENT'],
    );
  }
}
