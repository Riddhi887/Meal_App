import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body:
          /*PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.glutenFree, _glutenFreeFilterSet);
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.lactoseFree, _lactoseFreeFilterSet);
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.vegetarian, _vegterianFilterSet);
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.vegan, _veganFilterSet);
          }
        },
        child:
        
        */
          Column(
            children: [
              SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.glutenFree, isChecked);
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  'Includes Gluten-Free Meals.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 35, right: 23),
              ),
              SwitchListTile(
                value: activeFilters[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.lactoseFree, isChecked);
                },
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  'Includes Lactose-Free Meals.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 35, right: 23),
              ),
               SwitchListTile(
                value: activeFilters[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.vegetarian, isChecked);
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  'Includes Vegetarian Meals.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 35, right: 23),
              ),
              SwitchListTile(
                value: activeFilters[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.vegan, isChecked);
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  'Includes Vegan Meals.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 35, right: 23),
              ),
            ],
          ),
    );
  }
}
