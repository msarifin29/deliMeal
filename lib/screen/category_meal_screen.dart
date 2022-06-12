import 'package:flutter/material.dart';

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
    final categoryid = routArg['id'];
    final categoryTitle = routArg['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
    );
  }
}
