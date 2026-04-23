import 'user_model.dart';

/// Auth service interface
/// TODO(Sangu): Implement login/register/logout with Firebase/Hive
abstract class AuthService {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password, String name);
  Future<void> logout();
  User? get currentUser;
  bool get isAuthenticated;

  // Hive integration TODO(Bau)
}
