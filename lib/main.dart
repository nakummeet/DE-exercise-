import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/auth_guard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final loggedIn = await AuthGuard.isLoggedIn();
  runApp(MyApp(isLoggedIn: loggedIn));
}
