import 'package:hive/hive.dart';
import '../../features/goals/goal_model.dart';
import '../../features/savings/savings_model.dart';
import '../../features/transactions/transaction_model.dart';

/// Utilidad para volcar el contenido de Hive a la consola.
/// Usar solo en desarrollo/debug.
///
/// Ejemplo de uso:
/// ```dart
/// import 'hive_debug.dart';
///
/// // En cualquier lugar (botón, init, etc.):
/// await dumpHiveToConsole();
/// ```
Future<void> dumpHiveToConsole() async {
  final goalBox = await Hive.openBox<GoalModel>('goals');
  final savingsBox = await Hive.openBox<SavingsModel>('savings');
  final transactionBox = await Hive.openBox<TransactionModel>('transactions');

  print('╔══════════════════════════════════════╗');
  print('║         HIVE DATABASE DUMP           ║');
  print('╚══════════════════════════════════════╝');

  print('\n📌 GOALS (${goalBox.length} registros):');
  if (goalBox.isEmpty) {
    print('   (vacío)');
  } else {
    for (final g in goalBox.values) {
      print('   → ${g.toJson()}');
    }
  }

  print('\n💰 SAVINGS (${savingsBox.length} registros):');
  if (savingsBox.isEmpty) {
    print('   (vacío)');
  } else {
    for (final s in savingsBox.values) {
      print('   → ${s.toJson()}');
    }
  }

  print('\n📊 TRANSACTIONS (${transactionBox.length} registros):');
  if (transactionBox.isEmpty) {
    print('   (vacío)');
  } else {
    for (final t in transactionBox.values) {
      print('   → ${t.toJson()}');
    }
  }

  print('\n✅ Fin del dump\n');
}
