import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_meal_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';
import 'screen/category_screen.dart';
import 'screen/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      // initialRoute: '/category',
      routes: <String, WidgetBuilder>{
        '/category': (context) => const CategoryScreen(),
        '/category-meal': (context) => const CategoryMealScreen(),
        '/meal-detail': (context) => const MealDetailScreen()
      },
      home: const TabsScreen(),
    );
  }
}
