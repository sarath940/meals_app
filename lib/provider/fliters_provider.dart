import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filters { glutenfree, lactosefree, vegetrain, vegan }

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosefree: false,
          Filters.vegetrain: false,
          Filters.vegan: false,
        });

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filters, bool> chosenfilters) {
    state = chosenfilters;
  }
}

final filterProviders =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

final filterMealsProvider = Provider((ref) {
  var meals = ref.watch(mealsProvider);
  var activeFilters = ref.watch(filterProviders);
  return meals.where((meal) {
    if (activeFilters[Filters.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegetrain]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
