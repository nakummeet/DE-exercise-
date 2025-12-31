import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../../core/storage/token_storage.dart';
import '../models/report_model.dart';

class ProgressService {
  Future<void> markDay(int day) async {
    final token = await TokenStorage.get();

    await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.progress),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'day': day,
        'completed': true,
      }),
    );
  }

  Future<ReportModel?> getReport() async {
    final token = await TokenStorage.get();

    final res = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.report),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode == 200) {
      return ReportModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }
}
