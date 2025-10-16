import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_provider.dart';

//as we use the riverpod package Riverpod package becomes ConsumerWidget

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  // to trigger the ref we use WidgetRef
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);


    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavouriteStatus(
                    meal,
                  ); // as we created notifier function we pass it here

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Meal added as Favorites.'
                        : 'Meal removed from Favorites.',
                  ),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border_outlined),
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
