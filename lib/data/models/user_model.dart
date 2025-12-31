class UserModel {
  final String name;
  final String email;
  final int? height;
  final int? weight;
  final int challengeDays;
  final String? profileImage;
  final String? bmi;

  UserModel({
    required this.name,
    required this.email,
    this.height,
    this.weight,
    required this.challengeDays,
    this.profileImage,
    this.bmi,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      height: json['height'],
      weight: json['weight'],
      challengeDays: json['challengeDays'],
      profileImage: json['profileImage'],
      bmi: json['bmi'],
    );
  }
}
