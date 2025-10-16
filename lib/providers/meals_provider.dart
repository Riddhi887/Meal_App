//it contains the meal provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';

//instantiate a provider class and store it in variable
//needs a compulsory parameter of type Function
//ref allows you to set listners to consumers
final mealsProvider = Provider(
  (ref) {
  return dummyMeals;      //refer dummyMeals
});
