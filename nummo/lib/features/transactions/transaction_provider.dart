import 'package:flutter/material.dart';
import 'transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> transactions = [];

  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  double get balance => transactions.fold(
    0.0,
    (sum, t) => t.type == 'income' ? sum + t.amount : sum - t.amount,
  );
  // TODO(Ro): Filter incomes/expenses
}
