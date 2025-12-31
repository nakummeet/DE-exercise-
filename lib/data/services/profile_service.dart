import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';
import '../../core/storage/token_storage.dart';
import '../models/user_model.dart';

class ProfileService {
  /// GET profile
  Future<UserModel?> fetchProfile() async {
    final token = await TokenStorage.get();

    final res = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.profile),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }

  /// UPDATE profile
  Future<void> updateProfile({
    required String name,
    int? height,
    int? weight,
  }) async {
    final token = await TokenStorage.get();

    await http.put(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.profile),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": name,
        "height": height,
        "weight": weight,
      }),
    );
  }
}
