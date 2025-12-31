import 'package:flutter/material.dart';
import '../../data/services/progress_service.dart';
import 'exercise_screen.dart';

class DayListScreen extends StatefulWidget {
  final int totalDays;

  const DayListScreen({super.key, required this.totalDays});

  @override
  State<DayListScreen> createState() => _DayListScreenState();
}

class _DayListScreenState extends State<DayListScreen> {
  final ProgressService _progressService = ProgressService();
  List<int> _completedDays = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCompletedDays();
  }

  Future<void> _loadCompletedDays() async {
    final report = await _progressService.getReport();
    setState(() {
      _completedDays = report?.completedDays ?? [];
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final completedCount = _completedDays.length;
    final progress = completedCount / widget.totalDays;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "${widget.totalDays}-Day Challenge",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_challange_screen.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 80),

                LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.white30,
                  valueColor:
                  const AlwaysStoppedAnimation(Colors.green),
                ),

                const SizedBox(height: 10),

                Text(
                  "$completedCount / ${widget.totalDays} days completed",
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 30),

                ...List.generate(widget.totalDays, (index) {
                  final day = index + 1;
                  final completed = _completedDays.contains(day);

                  return Card(
                    color: completed
                        ? Colors.green.withOpacity(0.25)
                        : Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      enabled: !completed,
                      leading: CircleAvatar(
                        backgroundColor:
                        completed ? Colors.green : Colors.orange,
                        child: completed
                            ? const Icon(Icons.check,
                            color: Colors.white)
                            : Text(
                          "$day",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        "Day $day Workout",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: completed
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Text(
                        completed
                            ? "Completed"
                            : "Tap to start workout",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: completed
                          ? const Icon(Icons.lock,
                          color: Colors.white54)
                          : const Icon(Icons.play_arrow,
                          color: Colors.white),
                      onTap: completed
                          ? null
                          : () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ExerciseScreen(day: day),
                          ),
                        );
                        _loadCompletedDays(); // refresh UI
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
