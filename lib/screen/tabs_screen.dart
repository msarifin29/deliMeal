import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/favorit_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  void _selectPages(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const CategoryScreen(), 'title': 'Category'},
      {
        'page': FavoritScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorite'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPages,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
