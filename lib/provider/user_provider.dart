import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  static String _role;

  void changeRole(String newRole) {
    _role = newRole;
    notifyListeners();
  }

  String get getRole {
    return _role;
  }
}
