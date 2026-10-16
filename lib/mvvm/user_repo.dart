import 'package:companion/mvvm/user_model.dart';

class UserRepository{
  Future<UserProfileModel> fetchUserFromApi() async{
    await Future.delayed(const Duration(microseconds: 500));
    return UserProfileModel(id: 'usr_101', userName: 'Bob', isSubscribed: false);
  }
}