import 'package:flutter/material.dart';
import 'user_model.dart';
import 'auth_service.dart';

/// Auth provider for state management
/// TODO(Sangu): Connect to AuthService, notify listeners
class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    // TODO: impl
    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String email, String password, String name) async {
    // TODO
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
