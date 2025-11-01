// lib/screens/challenge_selection.dart

import 'package:de/challenges/challenge30.dart';
import 'package:de/challenges/challenge60.dart';
import 'package:de/challenges/challenge90.dart';
import 'package:de/widgets/challenge_button.dart'; // Import the new widget
import 'package:flutter/material.dart';

class ChallengeSelectionPage extends StatelessWidget {
  const ChallengeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack to layer the background image and content
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/background_challange_screen.png', // Corrected path
            fit: BoxFit.cover,
          ),
          // Content
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Choose Your Challenge",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Select a goal to get started on your fitness journey.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ChallengeButton(
                  title: "30-Day Challenge",
                  subtitle: "Start your journey!",
                  color: Colors.orange,
                  onTap: () {
                    // Navigate to the 30-day challenge page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Challenge30()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ChallengeButton(
                  title: "60-Day Challenge",
                  subtitle: "Push your limits!",
                  color: Colors.green,
                  onTap: () {
                    // Navigate to the 60-day challenge page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Challenge60()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ChallengeButton(
                  title: "90-Day Challenge",
                  subtitle: "Transform your life!",
                  color: Colors.purple,
                  onTap: () {
                    // Navigate to the 90-day challenge page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Challenge90()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}