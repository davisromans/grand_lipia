import 'package:flutter/material.dart';
import 'package:test_app/Utils/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    phone: '',
    password: '',
    type: '',
    token: '',
    address: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
