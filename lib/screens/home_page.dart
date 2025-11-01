import 'package:de/screens/challenge_selection.dar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // By removing the Scaffold from this widget, we avoid nesting Scaffolds,
    // which is a better practice when this page is part of a larger screen with its own Scaffold.
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image - using the same one for a consistent feel
        Image.asset(
          'assets/images/background_challange_screen.png',
          fit: BoxFit.cover,
        ),
        // Gradient Overlay for better text readability over the background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.4)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Main Content Area
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                const Text(
                  'Welcome Back,',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  'Fitness Fan!', // This can be replaced with a dynamic user name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),

                // Active Challenge Card Widget
                _buildActiveChallengeCard(context),

                const SizedBox(height: 30),

                // Daily Workout Card Widget
                _buildDailyWorkoutCard(context),

                const Spacer(), // Pushes the bottom content down

                // "Explore Challenges" Button
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.fitness_center),
                    label: const Text('Explore All Challenges'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the screen where users can pick a challenge
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const ChallengeSelectionPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// A helper widget to build the "Active Challenge" card.
  Widget _buildActiveChallengeCard(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Challenge',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '30-Day Fat Burn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            // Progress Bar to show challenge completion
            const LinearProgressIndicator(
              value: 0.45, // Example progress: 45%
              backgroundColor: Colors.white30,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              minHeight: 8,
            ),
            const SizedBox(height: 10),
            const Text(
              'Day 14 of 30',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A helper widget to build the "Daily Workout" card.
  Widget _buildDailyWorkoutCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation to a specific workout screen
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Daily Workout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Full Body Strength',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}

