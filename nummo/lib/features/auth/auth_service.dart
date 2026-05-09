import 'dart:async';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'user_model.dart';

class AuthService {
  static const String _boxName = 'users';
  static const String _currentUserKey = 'current_user';
  late Box<User> _box;
  final _uuid = const Uuid();

  final _authController = StreamController<User?>.broadcast();
  Stream<User?> get authStream => _authController.stream;

  Future<void> init() async {
    _box = await Hive.openBox<User>(_boxName);
    final currentUser = _box.get(_currentUserKey);
    _authController.add(currentUser);
  }

  Future<User?> login(String email, String password) async {
    // 1. Busca si existe un usuario con ese email
    final user = _box.values.cast<User?>().firstWhere(
      (u) => u?.email == email,
      orElse: () => null,
    );
    
    // 2. LA MAGIA: Verificamos si existe Y si la contraseña coincide
    if (user != null && user.password == password) {
      await _box.put(_currentUserKey, user.copyWith());
      _authController.add(user);
      return user; // Todo bien, lo deja pasar
    }
    
    // Si la contraseña es incorrecta o no existe, devuelve null
    return null; 
  }

  Future<User?> register(String email, String password, String name) async {
    // Verifica si el email ya existe
    final exists = _box.values.any((u) => u.email == email);
    if (exists) return null;

    // AHORA guardamos también la contraseña ingresada
    final user = User(id: _uuid.v4(), email: email, name: name, password: password);
    
    // Solo guardamos en la BD. No logueamos para que tenga que volver al login
    await _box.put(user.id, user);
    
    return user;
  }

  Future<void> logout() async {
    await _box.delete(_currentUserKey);
    _authController.add(null);
  }

  User? get currentUser => _box.get(_currentUserKey);
  bool get isAuthenticated => currentUser != null;

  Future<void> updateUser(User user) async {
    await _box.put(user.id, user);
    if (currentUser?.id == user.id) {
      await _box.put(_currentUserKey, user.copyWith());
      _authController.add(user);
    }
  }

  Future<void> dispose() async {
    await _authController.close();
  }
}