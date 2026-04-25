import 'dart:async';
import 'package:flutter/material.dart';
import 'savings_service.dart';
import 'savings_model.dart';

class SavingsProvider extends ChangeNotifier {
  final SavingsService _service;
  double _totalSavings = 0.0;
  List<SavingsModel> _entries = [];
  bool _isLoading = false;
  StreamSubscription? _subscription;

  double get totalSavings => _totalSavings;
  List<SavingsModel> get entries => _entries;
  bool get isLoading => _isLoading;

  SavingsProvider(this._service) {
    _init();
  }

  Future<void> _init() async {
    _setLoading(true);
    await _service.init();
    _totalSavings = _service.totalSavings;
    _entries = _service.getAllEntries();
    _subscription = _service.totalSavingsStream.listen((total) {
      _totalSavings = total;
      _entries = _service.getAllEntries();
      notifyListeners();
    });
    _setLoading(false);
  }

  Future<void> addSavings(double amount, {String? description}) async {
    _setLoading(true);
    await _service.addSavings(amount, description: description);
    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _service.dispose();
    super.dispose();
  }
}
