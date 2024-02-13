import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteProvider extends StateNotifier<List<Meal>> {
  FavoriteProvider() : super([]);

  bool toggleMealFavorite(Meal meal) {
    final isMealExist = state.contains(meal);
    if (isMealExist) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteProvider, List<Meal>>((ref) {
  return FavoriteProvider();
});
