//contains widget that will be used for single category in categories.dart
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  //accept the external data to display original category data
  final Category category;

  //to navigate through different screens
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    //return the data on the screen from the category package
    //to make a child wigdet tapable ye use GestureDector
    //if using InkWell we do get a feedback but not with GetureDector

    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(
        context,
      ).primaryColor, //visual tapping effect like a lil color change when when tapped
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: .55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          //here ! tells that we are going to define the text theme
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
