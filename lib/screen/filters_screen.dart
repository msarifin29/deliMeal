import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            'Filters',
            style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
