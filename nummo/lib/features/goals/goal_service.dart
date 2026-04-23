import 'goal_model.dart';

abstract class GoalService {
  Future<void> createGoal(GoalModel goal);
  Stream<List<GoalModel>> get goalsStream;
  Future<void> updateProgress(String id, double amount);
  // TODO(Valentino): Hive impl
}
