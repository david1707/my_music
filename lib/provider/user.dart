import 'package:flutter/cupertino.dart';
class UserProvider extends ChangeNotifier {
  String _role = 'user';

  void changeRole(String role) {
    _role = role;
    notifyListeners();
  }

  get getRole {
    return _role;
  }
}
