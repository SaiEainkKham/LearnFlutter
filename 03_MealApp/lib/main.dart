import 'package:flutter/material.dart';

import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/item_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: const Color.fromARGB(255, 227, 234, 196),
          textTheme: ThemeData.light().textTheme.copyWith(
                  bodyLarge: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ))),
      //home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(),
        CategoryPage.routeName: (ctx) => CategoryPage(),
        ItemPage.routeName: (ctx) => ItemPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dishes'),
      ),
      body: CategoryPage(),
    );
  }
}
