class ReportModel {
  final List<int> completedDays;
  final int currentStreak;
  final int maxStreak;

  ReportModel({
    required this.completedDays,
    required this.currentStreak,
    required this.maxStreak,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      completedDays: List<int>.from(json['completedDays']),
      currentStreak: json['currentStreak'],
      maxStreak: json['maxStreak'],
    );
  }
}
