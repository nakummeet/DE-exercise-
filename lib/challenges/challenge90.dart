import 'package:de/challenges/workout_detail_page.dart';
import 'package:flutter/material.dart';

class Challenge90 extends StatefulWidget {
  const Challenge90({super.key});

  @override
  State<Challenge90> createState() => _Challenge90State();
}

class _Challenge90State extends State<Challenge90> {
  // Generate a list for a 90-day challenge
  final List<bool> _dayCompletionStatus = List.generate(90, (index) => index < 15); // Example: First 15 days completed

  @override
  Widget build(BuildContext context) {
    int completedDays = _dayCompletionStatus.where((status) => status).length;
    double progress = completedDays / _dayCompletionStatus.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('90-Day Challenge', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_challange_screen.png',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppBar().preferredSize.height + 20),
                const Text(
                  'Your 90-Day Ultimate Overhaul!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Commit to 90 days of focused effort to completely overhaul your fitness, forge new habits, and unlock your ultimate potential.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  color: Colors.white.withOpacity(0.15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Challenge Progress',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white30,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$completedDays of ${_dayCompletionStatus.length} Days Completed (${(progress * 100).toInt()}%)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Daily Workouts:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ...List.generate(_dayCompletionStatus.length, (index) {
                  final day = index + 1;
                  return _buildDailyChallengeItem(
                    day: day,
                    title: 'Day $day: Peak Performance',
                    isCompleted: _dayCompletionStatus[index],
                    onTap: () async {
                      // You can customize the GIF list for each day
                      final List<String> workoutGifs = [
                        'assets/gifs/exe1.gif',
                        'assets/gifs/exe2.gif',
                        'assets/gifs/exe3.gif',
                        'assets/gifs/exe4.gif',
                        'assets/gifs/exe5.gif',
                        'assets/gifs/exe6.gif',
                        'assets/gifs/exe7.gif',
                        'assets/gifs/exe8.gif',
                        'assets/gifs/exe9.gif',
                        'assets/gifs/exe10.gif',
                      ];

                      final result = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailPage(
                            day: day,
                            title: 'Day $day Workout',
                            gifPaths: workoutGifs,
                          ),
                        ),
                      );

                      if (result == true) {
                        setState(() {
                          _dayCompletionStatus[index] = true;
                        });
                      }
                    },
                    onToggleComplete: () {
                      setState(() {
                        _dayCompletionStatus[index] = !_dayCompletionStatus[index];
                      });
                    },
                  );
                }),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyChallengeItem({
    required int day,
    required String title,
    required bool isCompleted,
    required VoidCallback onTap,
    required VoidCallback onToggleComplete,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: isCompleted ? Colors.green.withOpacity(0.2) : Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.green : Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isCompleted ? 'Completed!' : 'Tap to start workout',
                      style: TextStyle(
                        color: isCompleted ? Colors.white54 : Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isCompleted ? Icons.check_circle : Icons.circle_outlined,
                  color: isCompleted ? Colors.greenAccent : Colors.white54,
                  size: 30,
                ),
                onPressed: onToggleComplete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
