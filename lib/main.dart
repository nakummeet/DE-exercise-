// lib/main.dart

import 'package:flutter/material.dart';
import 'package:de/screens/main_scaffold.dart'; // Import the main scaffold

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Challenge',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScaffold(), // Your main screen with the navigation bar
    );
  }
}