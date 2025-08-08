import '../../domain/entities/meal.dart';

class CalorieApi {
  final List<MealEntity> _meals = [];

  Future<List<MealEntity>> getMeals() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_meals);
  }

  Future<List<MealEntity>> postMeal(String name, int calories) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final m = MealEntity(name: name, calories: calories);
    _meals.add(m);
    return List.from(_meals);
  }
}