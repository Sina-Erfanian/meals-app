import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screen/filters.dart';

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false
        });

  void setFilters(Map<Filters, bool> filters) {
    state = filters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((element) {
    if (activeFilters[Filters.glutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
