//SOLID - SINGLE RESPONSIBILITY PRINCIPLE

//class should only one reason to change.

import 'package:flutter/material.dart';

class UserManager {
  bool authenticateUser(String usrName, String pwd){
    return true;
  }

  void updateProfile(String usrName, Map<String,dynamic> profile){
    debugPrint("User profile updated for $usrName");
  }
}

//The above class violate the Single responsibility principle. If at all, the auth logic change in future
//then authenticateUser needs to be changed and updating profile is changed then the other method needs to be updated. Instead we can separate those two responsibilities like below.

class AuthManager{
  bool authenticateUser(String usrName, String pwd){
    return true;
  }
}

class ProfileManager {
  void updateProfile(String usrName, Map<String,dynamic> profile){
    debugPrint("User profile updated for $usrName");
  }
}

// helps in ReUsability
// helps in MAINTAINABILITY
// easier to test
//