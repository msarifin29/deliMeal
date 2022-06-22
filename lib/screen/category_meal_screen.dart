import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = '/category-meal';
  final List<Meal> availableMeals;

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadingData = false;
  @override
  void didChangeDependencies() {
    if (!_loadingData) {
      final routArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      // ignore: unused_local_variable
      final categoryId = routArg['id'];
      categoryTitle = routArg['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadingData = true;
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals?.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MealItem(
                  id: displayedMeals![index].id,
                  title: displayedMeals![index].title,
                  imageUrl: displayedMeals![index].imageUrl,
                  duration: displayedMeals![index].duration,
                  complexity: displayedMeals![index].complexity,
                  affordability: displayedMeals![index].affordability,
                ),
              ),
          itemCount: displayedMeals!.length),
    );
  }
}
