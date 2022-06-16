import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      bool currentValue, String title, String subTitle, updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      value: currentValue,
      onChanged: updateValue,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            _buildSwitchListTile(
                _glutenFree, 'GlutenFree', 'Only include glutenfree meals',
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                _vegan, 'GlutenFree', 'Only include vegan meals', (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(
                _vegetarian, 'GlutenFree', 'Only include vegetarian meals',
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile(
                _lactoseFree, 'GlutenFree', 'Only include lactoseFree meals',
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
          ],
        ));
  }
}
