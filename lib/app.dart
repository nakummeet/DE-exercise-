import 'package:de_exerciseapp/presentation/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/auth/login_screen.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MainNavigation() : const LoginScreen(),
    );
  }
}
