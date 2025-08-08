import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/calorie_repository.dart';
import '../../domain/entities/meal.dart';

final _apiProvider = Provider((ref) => CalorieApi());

class CalorieState {
  final List<MealEntity> meals;
  final int total;
  CalorieState({required this.meals, required this.total});
}

class CalorieNotifier extends StateNotifier<CalorieState> {
  static const int dailyTarget = 1800;
  final CalorieApi api;
  CalorieNotifier(this.api) : super(CalorieState(meals: [], total: 0)) {
    load();
  }

  Future<void> load() async {
    final m = await api.getMeals();
    final t = m.fold<int>(0, (p, e) => p + e.calories);
    state = CalorieState(meals: m, total: t);
  }

  Future<void> logMeal(String name, int calories) async {
    final m = await api.postMeal(name, calories);
    final t = m.fold<int>(0, (p, e) => p + e.calories);
    state = CalorieState(meals: m, total: t);
  }
}

final calorieNotifierProvider = StateNotifierProvider<CalorieNotifier, CalorieState>((ref) {
  final api = ref.read(_apiProvider);
  return CalorieNotifier(api);
});