import 'package:flutter/material.dart';
import 'goal_model.dart';

class GoalProvider extends ChangeNotifier {
  List<GoalModel> goals = [];

  void addGoal(GoalModel goal) {
    goals.add(goal);
    notifyListeners();
  }

  void updateGoalProgress(String id, double amount) {
    // TODO
    notifyListeners();
  }
}
