import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(' You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                ),
              ),
          itemCount: favoriteMeals.length);
    }
  }
}
