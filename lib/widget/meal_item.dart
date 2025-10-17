import 'package:flutter/material.dart';
import 'package:meal_app/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  //accessing the enum values
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // rounded edges for the card
      ),
      clipBehavior:
          Clip.hardEdge, // enforces the border radius, useful with Stack
      elevation: 4, // adds shadow to the background
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal); // pass context and meal 
        },

        // Stack is used to position widgets above each other along the z axis
        child: Stack(
          children: [
            // All widgets you want to stack above each other start from the one at the bottom
            // transparent_image package is used for a smooth transition between placeholder and final image
            // FadeInImage.memoryNetwork loads the image from network with a transparent placeholder

            //hero : animates widget across different screens (starting point)
            Hero(
              tag: meal.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl, // fetching the url from meal model
                fit: BoxFit.cover, // ensures the image fits nicely
                height: 200,
                width: double.infinity,
              ),
            ),

            // Positioned widget places a widget on top of another widget
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color:
                    Colors.black54, // semi-transparent black overlay for text
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 46),

                child: Column(
                  children: [
                    // Configuring title and styling it
                    Text(
                      meal.title,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      softWrap: true, // wraps the text neatly
                      overflow: TextOverflow
                          .ellipsis, // cuts text and shows ... if too long
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),

                        const SizedBox(width: 18),

                        //work icon with the label from the dummy data
                        //complexity is the enum and to get it we need to add getter
                        MealItemTrait(icon: Icons.work, label: complexityText),

                        // '${}' is use for string conversion
                        const SizedBox(width: 18),

                        //affordability is the enum and to get it we need to add getter
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
