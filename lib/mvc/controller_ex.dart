import 'dart:ui';

import 'package:companion/mvc/model_ex.dart';

class UserController{
  final UserModel _user = UserModel(name: 'Alice', points: 50);

  String get userName => _user.name;
  int get userPoints => _user.points;
  bool get isVip => _user.isVip;

  void addBonusPoints({required VoidCallback onStateChanged}){
    _user.points += 30;
    onStateChanged();
  }

}