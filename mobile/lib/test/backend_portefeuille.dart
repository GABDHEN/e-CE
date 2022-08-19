// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, camel_case_types, prefer_const_constructors_in_immutables, unused_local_variable, avoid_types_as_parameter_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobile/constants/constant.service.dart';
import 'package:mobile/features/auth/execptions/authexception.dart';

// Future<PORTEFEUILLE> authentication(
//     {required String login, required String password}) async {
//   final body = {"CODE_AGENCE": "1", "MATRICULE": login};
//   try {
//     final response = await http.post(Uri.parse(authUri), body: body);
//     final responseJson = jsonDecode(response.body);

//     if (!responseJson['response']['succes']) {
//       throw AuthException(errorMessage: responseJson['response']['error']);
//     }

//     // List<dynamic> userData =
//     //     responseJson['response']['user_data'] as List<dynamic>;

//     var userData = responseJson['response']['user_data'];

//     return PORTEFEUILLE.fromJson(userData[0] as Map<String, dynamic>);
//   } catch (e) {
//     throw AuthException(errorMessage: e.toString());
//   }
// }

Future<List<PORTEFEUILLE>> fetchPortefeuille({required String login}) async {
  final body = {"CODE_AGENCE": "1", "MATRICULE": login};
  final response = await http.post(Uri.parse(portUri), body: body);
  final responseJson = jsonDecode(response.body);

  try {
    if (response.body == login) {
      List jsonResponse = json.decode(response.body);
    }

    return responseJson
        .map((PORTEFEUILLE) => PORTEFEUILLE.fromJson(PORTEFEUILLE))
        .toList();
  } catch (e) {
    throw AuthException(errorMessage: e.toString());
  }
}

class PORTEFEUILLE {
  final String MATRICULE;
  final int NUMERO_ENTREPRISE;
  final DateTime DATE_AFFECTATION;
  final int ANNEE_CONTROLE;
  final int CODE_AGENCE;
  final String CONS_PAR;
  final String ORIGINE;

  PORTEFEUILLE(
      {required this.MATRICULE,
      required this.NUMERO_ENTREPRISE,
      required this.DATE_AFFECTATION,
      required this.ANNEE_CONTROLE,
      required this.CODE_AGENCE,
      required this.CONS_PAR,
      required this.ORIGINE});

  factory PORTEFEUILLE.fromJson(Map<String, dynamic> json) {
    return PORTEFEUILLE(
        MATRICULE: json['MATRICULE'] ?? "",
        NUMERO_ENTREPRISE: json['NUMERO_ENTREPRISE'] ?? "",
        DATE_AFFECTATION: json['DATE_AFFECTATION'] ?? "",
        ANNEE_CONTROLE: json['ANNEE_CONTROLE'] ?? "",
        CODE_AGENCE: json['CODE_AGENCE'] ?? "",
        CONS_PAR: json['CONS_PAR'] ?? "",
        ORIGINE: json['ORIGINE'] ?? "");
  }
}

// void main() => runApp(backend_portefeuille());

class backend_portefeuille extends StatefulWidget {
  backend_portefeuille({Key? key}) : super(key: key);

  @override
  _backend_portefeuilleState createState() => _backend_portefeuilleState();
}

class _backend_portefeuilleState extends State<backend_portefeuille> {
  late Future<List<PORTEFEUILLE>> portefeuilleData;

  @override
  void initState() {
    super.initState();
    portefeuilleData = fetchPortefeuille(login: "MATRICULE");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView'),
        ),
        body: Center(
          child: FutureBuilder<List<PORTEFEUILLE>>(
            future: portefeuilleData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PORTEFEUILLE>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final item = items[index];
                      return Container(
                        height: 75,
                        color: Colors.white,
                        child: Center(
                          child: Text(data![index].MATRICULE),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
