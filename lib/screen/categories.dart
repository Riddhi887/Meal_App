import 'package:flutter/foundation.dart' hide Category;
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/widget/categories_grid_item.dart';

//here we know need to manage any state so its stateless widget
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// with merges a class with another class
// if single AnimationController use SingleTickerProviderStateMixin if multiple then use TicketProviderStateMixin

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  //animations for the widget
  //must be set before build method and in init state
  //late : tells dart it dont have inital value but will have value when been used for first time
  //AnimationController: type of value a variable will hold

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync:
          this, //vsync: make sure it gets info needed and fires animation is executed for every frame for 60 times per second
      duration: Duration(milliseconds: 300),
      //btw which value animation should take place is upper and lower bound
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();   //starts the animation 
  }

  

  @override
  void dispose() {
    _animationController
        .dispose(); //removes the animation from memory once widget removed from screen
    super.dispose();
  }

  //in stateless widget the context is not globally avail. so thake it as parameter
  void _selectCategory(BuildContext context, Category category) {
    //in dummyMeals check the categories and then whether it contains those meals or not
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    //push will pust the route on the stack of screen = navigation

    //  Navigator.push(context, route); //to navigate to the screens or use below

    //to create a route we use MaterialPageRoute

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  //override build()
  @override
  Widget build(BuildContext context) {
    //listen the animation from AnimationController
    return AnimatedBuilder(
      animation: _animationController, 
      child: GridView(

      //controls the UI of the grid on the screen
      padding: const EdgeInsets.only(left: 10, right: 10),
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

      //here builder function call Padding widget and has parameter child : child where 2nd child is GridView
      //here Padding widget will re-built continuously 60 times per second rather than GridView 
      builder: (context, child ) => 
      SlideTransition(
        position:Tween(
            begin: const Offset(0, 0.3),  //values to start animation of x and y axis
            end:  const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController, 
              curve: Curves.easeInOut,
              ),
              ),

          //Tween class describes the value for the animation
         child: child     //here child (2nd) is the GridView that needs to be animated 
         ),
          );

    //return a widget
    //every multiScreen app uses a scaffold widget to build a base of the app with a widget
    
  }
}
