import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class favouriteMealsNotifier extends StateNotifier<List<Meal>> {
  favouriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<favouriteMealsNotifier, List<Meal>>((ref) {
  return favouriteMealsNotifier();
});
