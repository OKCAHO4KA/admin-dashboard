import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider({this.token}) {
    isAuthenticated();
  }

  login(String emmail, String password) {
    token = 'XXXCCCVVVBBB';
    LocalStorage.prefs.setString('token', token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
