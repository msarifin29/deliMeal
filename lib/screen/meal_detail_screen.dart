import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(
    BuildContext context,
    String text,
  ) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildContainer(
    Widget child,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              'Ingredients',
            ),
            buildContainer(
              ListView.builder(
                  itemCount: selectMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(selectMeal.ingredients[index]),
                        ),
                      )),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectMeal.steps[index]),
                    )))
          ],
        ),
      ),
    );
  }
}