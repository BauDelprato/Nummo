import 'package:flutter/material.dart';

class SavingsProvider extends ChangeNotifier {
  double totalSavings = 0.0;
  void addSavings(double amount) {
    totalSavings += amount;
    notifyListeners();
  } // TODO(Agus): Connect to service
}
