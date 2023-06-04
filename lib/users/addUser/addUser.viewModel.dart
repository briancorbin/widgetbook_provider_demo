import 'package:flutter/material.dart';

class AddUserViewModel extends ChangeNotifier {
  String name = '';
  String email = '';

  Function? onSave;

  AddUserViewModel({this.onSave});

  onNameChanged(String value) {
    name = value;
    notifyListeners();
  }

  onEmailChanged(String value) {
    email = value;
    notifyListeners();
  }

  saveUser() {
    onSave!(name, email);
  }
}
