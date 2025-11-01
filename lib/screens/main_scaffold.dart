// lib/screens/main_scaffold.dart

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:de/screens/challenge_selection.dar.dart';
import 'package:de/screens/profile_page.dart';
import 'package:de/screens/report_page.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ChallengeSelectionPage(),
    const ReportPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Allow the body to extend behind the navigation bar
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        // 2. Set the background color (the area around the curve) to transparent
        backgroundColor: Colors.transparent,
        // 3. Set the color of the bar itself to be semi-transparent black
        color: Colors.black.withOpacity(0.6),
        buttonBackgroundColor: Colors.orange,
        height: 60,
        index: _currentIndex,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.bar_chart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}