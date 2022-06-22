import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/category_meal_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';
import 'screen/category_screen.dart';
import 'screen/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false
  };

  // ignore: unused_field
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavoriteMeals(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/tabs',
      routes: <String, WidgetBuilder>{
        '/tabs': (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        '/category-meal': (context) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        '/meal-detail': (context) => MealDetailScreen(
              favoriteMeals: toggleFavorite,
              isFavorite: _isFavoriteMeals,
            ),
        '/filters': (context) {
          return Filters(
            saveFilters: _setFilters,
            currentFilters: _filters,
          );
        }
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      },
      // home: TabsScreen(),
    );
  }
}
