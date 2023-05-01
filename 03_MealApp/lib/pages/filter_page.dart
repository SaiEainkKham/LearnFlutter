import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilteredPage extends StatefulWidget {
  static const routeName = '/filter-page';

  final Function saveFilter;
  final Map<String, bool> currentFilter;

  const FilteredPage({
    super.key,
    required this.saveFilter,
    required this.currentFilter,
  });

  @override
  State<FilteredPage> createState() => _FilteredPageState();
}

class _FilteredPageState extends State<FilteredPage> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) updataValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updataValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilter);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only include gluten free meal',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'Only include lactose free meal',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meal',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meal',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
