class UserModel {
  String name;
  int points;

  UserModel({required this.name, required this.points});

  bool get isVip => points >= 100;
}