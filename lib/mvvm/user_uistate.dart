import 'package:companion/mvvm/user_model.dart';

class UserUIState {
  final bool isLoading;
  final UserProfileModel? user;
  final String? errorMessage;

  UserUIState({this.isLoading = false, this.user, this.errorMessage});
}