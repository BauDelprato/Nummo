import 'dart:async';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'savings_model.dart';

class SavingsService {
  static const String _boxName = 'savings';
  late Box<SavingsModel> _box;
  final _uuid = const Uuid();

  final _savingsController = StreamController<double>.broadcast();
  Stream<double> get totalSavingsStream => _savingsController.stream;

  Future<void> init() async {
    _box = await Hive.openBox<SavingsModel>(_boxName);
    _notify();
  }

  Future<void> addSavings(double amount, {String? description}) async {
    final entry = SavingsModel(
      id: _uuid.v4(),
      amount: amount,
      date: DateTime.now(),
      description: description,
    );
    await _box.put(entry.id, entry);
    _notify();
  }

  double get totalSavings {
    return _box.values.fold(0.0, (sum, s) => sum + s.amount);
  }

  List<SavingsModel> getAllEntries() {
    return _box.values.toList();
  }

  void _notify() {
    _savingsController.add(totalSavings);
  }

  Future<void> dispose() async {
    await _savingsController.close();
    await _box.close();
  }
}
