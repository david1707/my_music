import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String _role = '';
  

  void changeRole(String newRole) {
    _role = newRole;
    print('CHANGEROLE: $_role');
    notifyListeners();
  }

  String get getRole {
    print('GETROLE: $_role');
    return _role;
  }
}
