import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class AuthService {
  Future<String?> login(String email, String password) async {
    final res = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body)['token'];
    }
    return null;
  }
}
