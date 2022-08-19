import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/constants/constant.service.dart';
import 'package:mobile/features/auth/execptions/authexception.dart';
import 'package:mobile/features/auth/models/userInfos.dart';

class AuthService {
  AuthService();

  Future<UserInfos> authentication(
      {required String login, required String password}) async {
    final body = {"CODE_AGENCE": "1", "MATRICULE": login};
    try {
      final response = await http.post(Uri.parse(authUri), body: body);
      final responseJson = jsonDecode(response.body);

      if (!responseJson['response']['succes']) {
        throw AuthException(errorMessage: responseJson['response']['error']);
      }

      // List<dynamic> userData =
      //     responseJson['response']['user_data'] as List<dynamic>;

      var userData = responseJson['response']['user_data'];

      return UserInfos.fromJson(userData[0] as Map<String, dynamic>);
    } catch (e) {
      throw AuthException(errorMessage: e.toString());
    }
  }
}
