import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavourite(meal);    // we dont have direct access to the tabs so we created a function and passed it here ultimately
            },
            icon: Icon(Icons.star_border_outlined),
          ),
        ],
      ),

      // you can use ListView for automatic scrolling
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ), // Adjust left padding as needed
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 18),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            //steps
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ), // Adjust left padding as needed
              child: Text(
                'Steps for the Meal',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 18),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 15, right: 18),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),

      // accessiing the images
    );
  }
}
