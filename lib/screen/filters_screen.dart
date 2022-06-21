import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      bool currentValue, String title, String subTitle, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: (value) => updateValue(value),
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectFilters = {
                    'gluten': _glutenFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                    'lactose': _lactoseFree
                  };
                  widget.saveFilters(selectFilters);
                },
                icon: const Icon(Icons.save_rounded))
          ],
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
            _buildSwitchListTile(_vegan, 'Vegan', 'Only include vegan meals',
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(
                _vegetarian, 'Vegetarian', 'Only include vegetarian meals',
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile(
                _lactoseFree, 'LactoseFree', 'Only include lactoseFree meals',
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
          ],
        ));
  }
}
