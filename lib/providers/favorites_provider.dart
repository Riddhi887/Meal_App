//contains the provider for favourite meal list
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meal_app/models/meal.dart';

// create your own class and extend the StateNotifier() class of riverpod and is the generic class
//StateNotifierProvider works with StateNotifier()

class favoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //pass the empty list at the beginning
  //here pass a constructor function and initalize it to the parent class using super() and pass the data of your choice

  favoriteMealsNotifier() : super([]); //passed data : empty list []

  //add the methods that will edit the above data
  bool toggleMealFavouriteStatus(Meal meal) {
    //look into the meal to see if its fav : state.contains()
    final mealIsFavorite = state.contains(meal);

    //if is  favourite remove the emal from list without .remove() use .where() and filter using .toList()
    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); //check if the new meal id is same or not as thosee in favoriteMEals
      return false;
    } else {
      //here we are not allowed to manipulate the data in memory instead we have to replace the data or create new one
      //assigning the new list
      // ... pull out existing elements from list as individual elements and add if meal if any is recently added to fav
      state = [...state, meal];
      return true;
    }
  }
}

//use StateNotifierProvider when the data is to be changes or manipulated at some circumstances
//here the StateNotifierProvider is generic type and dont now what data to yeild so we pass the data that needs to be yeild or manipulate

final favoriteMealsProvider =
    StateNotifierProvider<favoriteMealsNotifier, List<Meal>>((ref) {
      return favoriteMealsNotifier();
    });
