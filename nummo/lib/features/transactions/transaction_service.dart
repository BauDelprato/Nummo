import 'transaction_model.dart';

abstract class TransactionService {
  Future<void> addTransaction(TransactionModel transaction);
  Stream<List<TransactionModel>> get transactionsStream;
  Future<double> get balance;
  // TODO(Ro): Hive logic for incomes/expenses
}
