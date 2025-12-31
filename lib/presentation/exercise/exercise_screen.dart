import 'dart:async';
import 'package:flutter/material.dart';
import 'exercise_data.dart';
import '../../data/services/progress_service.dart';

class ExerciseScreen extends StatefulWidget {
  final int day;

  const ExerciseScreen({super.key, required this.day});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  static const int _workoutDuration = 3; // seconds per exercise

  final ProgressService _progressService = ProgressService();

  Timer? _timer;
  int _countdown = _workoutDuration;
  bool _isWorkoutStarted = false;
  bool _isCurrentExerciseFinished = false;
  int _currentExerciseIndex = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startWorkout() {
    if (_isWorkoutStarted) return;
    setState(() => _isWorkoutStarted = true);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _countdown = _workoutDuration;
    _isCurrentExerciseFinished = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() => _countdown--);
      } else {
        timer.cancel();
        setState(() => _isCurrentExerciseFinished = true);
      }
    });
  }

  void _nextExercise() {
    if (_currentExerciseIndex < ExerciseData.exercises.length - 1) {
      setState(() => _currentExerciseIndex++);
      _startTimer();
    }
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      setState(() => _currentExerciseIndex--);
      _startTimer();
    }
  }

  Future<void> _completeDay() async {
    await _progressService.markDay(widget.day);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastExercise =
        _currentExerciseIndex == ExerciseData.exercises.length - 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Day ${widget.day} Workout",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Exercise ${_currentExerciseIndex + 1} / ${ExerciseData.exercises.length}',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // GIF CARD
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
                        ExerciseData.exercises[_currentExerciseIndex],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // TIMER
                  Text(
                    !_isWorkoutStarted
                        ? "Ready?"
                        : _isCurrentExerciseFinished
                        ? "Finished!"
                        : "00:${_countdown.toString().padLeft(2, '0')}",
                    style: TextStyle(
                      color: _isCurrentExerciseFinished
                          ? Colors.greenAccent
                          : Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  _buildControls(isLastExercise),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildControls(bool isLastExercise) {
    if (!_isWorkoutStarted) {
      return ElevatedButton.icon(
        icon: const Icon(Icons.play_arrow),
        label: const Text("Start Workout"),
        onPressed: _startWorkout,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (isLastExercise && _isCurrentExerciseFinished) {
      return ElevatedButton(
        onPressed: _completeDay,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text("Mark Day as Complete"),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _currentExerciseIndex > 0 ? _previousExercise : null,
          child: const Text("Previous"),
        ),
        ElevatedButton(
          onPressed: _isCurrentExerciseFinished && !isLastExercise
              ? _nextExercise
              : null,
          child: const Text("Next"),
        ),
      ],
    );
  }
}
