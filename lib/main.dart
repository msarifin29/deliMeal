import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_meal_screen.dart';
import 'screen/category_screen.dart';

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
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      // initialRoute: '/category',
      routes: <String, WidgetBuilder>{
        '/category': (context) => const CategoryScreen(),
        '/category-meal': (context) => const CategoryMealScreen()
      },
      home: const CategoryScreen(),
    );
  }
}
