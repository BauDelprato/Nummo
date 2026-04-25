abstract class SavingsService {
  Future<void> addSavings(double amount);
  Stream<double> get totalSavings;
  // TODO(Agus): Hive logic
}
