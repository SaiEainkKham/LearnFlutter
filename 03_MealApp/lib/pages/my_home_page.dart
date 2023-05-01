import 'package:flutter/material.dart';

import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/favorite_page.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _pages = [
    {'pages': CategoryPage(), 'title': 'Categories'},
    {'pages': FavoritePage(), 'title': 'Favorites'},
  ];

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'] as String),
      ),
      body: _pages[_selectPageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
