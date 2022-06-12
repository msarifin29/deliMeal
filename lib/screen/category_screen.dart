import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          excludeHeaderSemantics: true,
          title: Text(
            'DeliMeal',
          )),
      body: GridView(
          padding: EdgeInsets.all(15),
          children: dummy_categories
              .map((dataCat) => CategoryItem(
                  id: dataCat.id, title: dataCat.title, color: dataCat.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
