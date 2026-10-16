import 'package:flutter/cupertino.dart';

class ProfileController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();


  bool isFormValid = false;
  String welComeMsg = '';

  void validateAndSubmit(VoidCallback updateUI){
    final name = nameController.text;
    final age = int.tryParse(ageController.text)??0;
    if (name.isNotEmpty && age >= 18) {
      isFormValid = true;
      welComeMsg = 'Welcome, $name! (Age: $age)';
    } else {
      isFormValid = false;
      welComeMsg = 'Invalid input: Must be 18+';
    }
    // updateUi();


  }
}