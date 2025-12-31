import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exercise/day_list_screen.dart';
import '../../widgets/challenge_button.dart';

const String ACTIVE_CHALLENGE_KEY = "active_challenge_days";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _activeChallengeDays;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadActiveChallenge();
  }

  /// Load saved challenge (NO navigation here)
  Future<void> _loadActiveChallenge() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activeChallengeDays = prefs.getInt(ACTIVE_CHALLENGE_KEY);
      _loading = false;
    });
  }

  /// Save challenge and navigate
  Future<void> _saveAndNavigate(int days) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(ACTIVE_CHALLENGE_KEY, days);

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DayListScreen(totalDays: days),
      ),
    );
  }

  /// Custom challenge dialog
  void _showCustomDayDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Custom Challenge",
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter number of days",
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel",
                  style: TextStyle(color: Colors.white70)),
            ),
            ElevatedButton(
              onPressed: () {
                final days = int.tryParse(controller.text);
                if (days == null || days <= 0 || days > 365) return;

                Navigator.pop(context);
                _saveAndNavigate(days);
              },
              child: const Text("Start"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_challange_screen.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                const Text(
                  "Choose Your Challenge",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Select a goal to get started",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 40),

                ChallengeButton(
                  title: "30-Day Challenge",
                  subtitle: "Start your journey",
                  color: Colors.orange,
                  onTap: () => _saveAndNavigate(30),
                ),

                const SizedBox(height: 20),

                ChallengeButton(
                  title: "60-Day Challenge",
                  subtitle: "Push your limits",
                  color: Colors.green,
                  onTap: () => _saveAndNavigate(60),
                ),

                const SizedBox(height: 20),

                ChallengeButton(
                  title: "90-Day Challenge",
                  subtitle: "Transform your life",
                  color: Colors.purple,
                  onTap: () => _saveAndNavigate(90),
                ),

                const SizedBox(height: 20),

                ChallengeButton(
                  title: "Custom Challenge",
                  subtitle: "Choose your own days",
                  color: Colors.blueGrey,
                  onTap: _showCustomDayDialog,
                ),

                // 🔽 RESUME SECTION (NEW, SAFE)
                if (_activeChallengeDays != null) ...[
                  const SizedBox(height: 40),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 20),

                  Text(
                    "Resume Active Challenge",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  ChallengeButton(
                    title:
                    "Continue ${_activeChallengeDays}-Day Challenge",
                    subtitle: "Pick up where you left off",
                    color: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DayListScreen(
                            totalDays: _activeChallengeDays!,
                          ),
                        ),
                      );
                    },
                  ),
                ],

                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
