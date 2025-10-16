import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/filters.dart';
import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/widget/main_drawer.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilter;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(FilterMealsProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = 'Categories';

    // Favorites Tab
    if (_selectedPageIndex == 1) {
      // Get favorite meals from the Riverpod provider
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals, // Use the provider data, not local list
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
