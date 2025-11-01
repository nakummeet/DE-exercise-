import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutDetailPage extends StatefulWidget {
  final int day;
  final String title;
  final List<String> gifPaths; // Now accepts a LIST of GIFs

  const WorkoutDetailPage({
    super.key,
    required this.day,
    required this.title,
    required this.gifPaths,
  });

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  static const int _workoutDuration = 10; // Duration for EACH exercise
  late Timer _timer;
  int _countdown = _workoutDuration;
  bool _isCurrentExerciseFinished = false;
  int _currentExerciseIndex = 0;
  bool _isWorkoutStarted = false; // New state to control the start

  @override
  void initState() {
    super.initState();
    // Timer no longer starts automatically
  }

  void _startWorkoutSession() {
    if (_isWorkoutStarted) return; // Prevent multiple starts
    setState(() {
      _isWorkoutStarted = true;
    });
    startTimer();
  }

  void startTimer() {
    _countdown = _workoutDuration;
    _isCurrentExerciseFinished = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _isCurrentExerciseFinished = true;
        });
        _timer.cancel();
      }
    });
  }

  void _goToNextExercise() {
    if (_currentExerciseIndex < widget.gifPaths.length - 1) {
      _timer.cancel();
      setState(() {
        _currentExerciseIndex++;
      });
      startTimer(); // Subsequent exercises start automatically
    }
  }

  void _goToPreviousExercise() {
    if (_currentExerciseIndex > 0) {
      _timer.cancel();
      setState(() {
        _currentExerciseIndex--;
      });
      startTimer(); // Subsequent exercises start automatically
    }
  }

  @override
  void dispose() {
    if (_isWorkoutStarted) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastExercise = _currentExerciseIndex == widget.gifPaths.length - 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgroun_exe.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.7)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Exercise ${_currentExerciseIndex + 1} / ${widget.gifPaths.length}',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.gifPaths[_currentExerciseIndex], // Display current GIF
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              'GIF not found.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    !_isWorkoutStarted
                        ? "Ready?"
                        : _isCurrentExerciseFinished
                        ? "Finished!"
                        : "00:${_countdown.toString().padLeft(2, '0')}",
                    style: TextStyle(
                      color: _isCurrentExerciseFinished ? Colors.greenAccent : Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildActionArea(isLastExercise),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionArea(bool isLastExercise) {
    if (!_isWorkoutStarted) {
      // Show start button if the workout hasn't started
      return ElevatedButton.icon(
        icon: const Icon(Icons.play_arrow),
        label: const Text('Start Workout'),
        onPressed: _startWorkoutSession,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    } else if (isLastExercise && _isCurrentExerciseFinished) {
      // Show complete button on the last exercise when finished
      return ElevatedButton(
        onPressed: () => Navigator.of(context).pop(true),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: const Text('Mark Day as Complete'),
      );
    } else {
      // Show navigation buttons during the workout
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _currentExerciseIndex > 0 ? _goToPreviousExercise : null,
            child: const Text('Previous'),
          ),
          ElevatedButton(
            onPressed: _isCurrentExerciseFinished && !isLastExercise ? _goToNextExercise : null,
            child: const Text('Next'),
          ),
        ],
      );
    }
  }
}

