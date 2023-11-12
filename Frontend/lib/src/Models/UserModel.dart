import 'package:flutter/foundation.dart';
import 'package:my_app/src/Models/UsersModel.dart';

class UserModel extends ChangeNotifier {
  UsersModel? _user;

  UsersModel? get user => _user;

  void setUser(UsersModel user) {
    _user = user;
    notifyListeners();
  }
}
