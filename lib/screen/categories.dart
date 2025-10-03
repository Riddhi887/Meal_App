import 'package:flutter/foundation.dart' hide Category;
import 'package:meal_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/widget/categories_grid_item.dart';


//here we know need to manage any state so its stateless widget
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //in stateless widget the context is not globally avail. so thake it as parameter
  void _selectCategory(BuildContext context, Category category) {

    //in dummyMeals check the categories and then whether it contains those meals or not 
   final filteredMeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();   

    //push will pust the route on the stack of screen = navigation

    //  Navigator.push(context, route); //to navigate to the screens or use below

    //to create a route we use MaterialPageRoute

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  //override build()
  @override
  Widget build(BuildContext context) {
    //return a widget
    //every multiScreen app uses a scaffold widget to build a base of the app with a widget
    return Scaffold(
      appBar: AppBar(title: Text('Choose Your Category')),

      //to render Grid Elements on the screen
      body: GridView(
        //controls the UI of the grid on the screen
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //set no. of column in particular screen
          childAspectRatio: 3 / 2, //set the size of that column
          crossAxisSpacing: 20, //space between coloumn
          mainAxisSpacing: 20,
        ),
        children: [
          //display the dummy data
          for (final category in availableCategories)
            //display the category item
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),

          //either we can use availableCategories.map((categories))
        ],
      ),
    );
  }
}
