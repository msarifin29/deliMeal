import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // ignore: unused_local_variable
    final categoryId = routArg['id'];
    final categoryTitle = routArg['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => Text(categoryTitle.toString()),
            itemCount: categoryMeal.length));
  }
}
