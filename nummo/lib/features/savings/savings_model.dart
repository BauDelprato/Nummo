import 'package:hive/hive.dart';

part 'savings_model.g.dart';

@HiveType(typeId: 1)
class SavingsModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String? description;

  SavingsModel({
    required this.id,
    required this.amount,
    required this.date,
    this.description,
  });

  factory SavingsModel.fromJson(Map<String, dynamic> json) => SavingsModel(
    id: json['id'] as String,
    amount: (json['amount'] as num).toDouble(),
    date: DateTime.parse(json['date'] as String),
    description: json['description'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description,
  };
}
