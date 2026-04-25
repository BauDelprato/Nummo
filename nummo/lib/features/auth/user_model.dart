import 'package:equatable/equatable.dart';

/// User model for authentication
/// TODO(Sangu): Add fields like id, name, email, balance from Hive
class User extends Equatable {
  final String id;
  final String email;
  final String name;

  const User({required this.id, required this.email, required this.name});

  @override
  List<Object?> get props => [id, email, name];

  // TODO: fromJson, toJson for Hive
  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], email: json['email'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'email': email, 'name': name};
}
