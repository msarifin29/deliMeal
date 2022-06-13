import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/favorit_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.star),
              )
            ]),
          ),
          body: TabBarView(children: [CategoryScreen(), FavoritScreen()]),
        ));
  }
}
