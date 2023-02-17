import 'package:flutter/cupertino.dart';
import 'package:revamph/models/user_model.dart';
import 'package:revamph/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthMethods _auth = AuthMethods();

  UserModel get getUser => _user!;
  bool get isLoggedIn => _user != null;
  Future<void> refreshUser() async {
    UserModel user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
