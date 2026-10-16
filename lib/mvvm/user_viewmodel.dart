import 'package:companion/mvvm/user_model.dart';
import 'package:companion/mvvm/user_repo.dart';
import 'package:companion/mvvm/user_uistate.dart';
import 'package:flutter/cupertino.dart';

class UserViewmodel extends ValueNotifier<UserUIState>{

  final UserRepository _repository;

  UserViewmodel(this._repository): super(UserUIState());

  // Action invoked by View
  Future<void> loadProfile() async {
    // Emit loading state
    value = UserUIState(isLoading: true);

    try {
      final user = await _repository.fetchUserFromApi();
      // Emit success state with user data
      value = UserUIState(isLoading: false, user: user);
    } catch (e) {
      // Emit error state
      value = UserUIState(isLoading: false, errorMessage: 'Failed to load profile');
    }
  }

  void toggleSubscription() {
    if (value.user == null) return;

    final currentUser = value.user!;
    final updatedUser = UserProfileModel(
      id: currentUser.id,
      userName: currentUser.userName,
      isSubscribed: !currentUser.isSubscribed,
    );

    value = UserUIState(isLoading: false, user: updatedUser);
  }

}