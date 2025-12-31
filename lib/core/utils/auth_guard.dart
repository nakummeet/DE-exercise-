import '../storage/token_storage.dart';

class AuthGuard {
  static Future<bool> isLoggedIn() async {
    final token = await TokenStorage.get();
    return token != null;
  }
}
