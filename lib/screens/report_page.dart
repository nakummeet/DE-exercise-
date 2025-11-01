import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String _userName = 'User';
  double _bmi = 0.0;
  String _bmiCategory = 'N/A';
  Color _bmiColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _calculateBmi(); // Calculate BMI when the page loads
  }

  // --- BMI Calculation and Data Loading ---
  Future<void> _calculateBmi() async {
    final prefs = await SharedPreferences.getInstance();
    // Load data, providing default values of 0 if not found
    final double heightCm = double.tryParse(prefs.getString('userHeight') ?? '0') ?? 0;
    final double weightKg = double.tryParse(prefs.getString('userWeight') ?? '0') ?? 0;
    final String name = prefs.getString('userName') ?? 'User';

    if (heightCm > 0 && weightKg > 0) {
      // BMI formula: weight (kg) / [height (m)]^2
      final double heightM = heightCm / 100;
      final double calculatedBmi = weightKg / (heightM * heightM);

      setState(() {
        _userName = name;
        _bmi = calculatedBmi;
        _setBmiDetails(calculatedBmi);
      });
    } else {
      // Reset to default values if data is missing
      setState(() {
        _userName = name;
        _bmi = 0;
        _bmiCategory = 'Enter height & weight in profile';
        _bmiColor = Colors.grey;
      });
    }
  }

  // --- Helper to determine BMI category and color ---
  void _setBmiDetails(double bmiValue) {
    if (bmiValue < 18.5) {
      _bmiCategory = 'Underweight';
      _bmiColor = Colors.blue;
    } else if (bmiValue >= 18.5 && bmiValue < 24.9) {
      _bmiCategory = 'Healthy Weight';
      _bmiColor = Colors.green;
    } else if (bmiValue >= 25 && bmiValue < 29.9) {
      _bmiCategory = 'Overweight';
      _bmiColor = Colors.orange;
    } else {
      _bmiCategory = 'Obesity';
      _bmiColor = Colors.red;
    }
  }

  // --- Build Method ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Your Fitness Report', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Add a refresh button to reload the data
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _calculateBmi,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_challange_screen.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.7)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Hello, $_userName!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Here's your current BMI analysis:",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 50),
                  _buildBmiGauge(),
                  const SizedBox(height: 30),
                  _buildBmiResultCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- UI Helper Widgets ---
  Widget _buildBmiGauge() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _bmiColor, width: 15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _bmi.toStringAsFixed(1), // Display BMI with one decimal place
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'BMI',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBmiResultCard() {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              'Your Category',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              _bmiCategory,
              style: TextStyle(
                color: _bmiColor, // Use the dynamic color
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'BMI is a value derived from the mass and height of a person. It can be a useful indicator of whether you are a healthy weight.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
