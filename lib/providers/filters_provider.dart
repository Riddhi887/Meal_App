//provider for the filters
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meal_app/providers/meals_provider.dart';
import 'package:meal_app/screen/filters.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  //method to manipulate the above value
  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  //set all filters when back button pressed
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final FilterMealsProvider = Provider((ref) {
  final meals = ref.watch(
    mealsProvider,
  ); // as to filter out the filtered meal we are depend on the dummyData so we watvh its provider
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
