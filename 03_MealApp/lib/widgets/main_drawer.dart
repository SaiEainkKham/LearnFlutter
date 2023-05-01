import 'package:flutter/material.dart';

import 'package:meal_app/pages/filter_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 227, 234, 196),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildListTile(
            'Meal',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            'Filter',
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FilteredPage.routeName),
          ),
        ],
      ),
    );
  }
}
