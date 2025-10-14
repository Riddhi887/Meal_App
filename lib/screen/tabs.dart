import 'package:flutter/material.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: []);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(
        activePageTitle,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
      
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
