import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.all(23),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 139, 34, 34),
                  const Color.fromARGB(255, 177, 43, 43),
                  const Color.fromARGB(255, 223, 70, 70),
                ],
                begin: AlignmentGeometry.bottomLeft,
                end: AlignmentGeometry.topRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Let's Cook !",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),

          // List Tile : to bundle up the info into single row here used for navigation from one category to another
          ListTile(
            //leading: helps to automatically set the widget at the beginning of the tile
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 21,
              ),
            ),

            onTap: () {
              onSelectScreen('meals'); //pass the identifier of meals cz in tabs.dart we can tell it which screen to be loaded
            },
          ),

          ListTile(
            //leading: helps to automatically set the widget at the beginning of the tile
            leading: Icon(
              Icons.filter_alt_outlined,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 21,
              ),
            ),

            onTap: () {
              onSelectScreen('filters');  //pass the identifier of filters
            },
          ),
        ],
      ),
    );
  }
}
