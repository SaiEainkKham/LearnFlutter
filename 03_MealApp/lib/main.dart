import 'package:flutter/material.dart';

import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/error_page.dart';
import 'package:meal_app/pages/favorite_page.dart';
import 'package:meal_app/pages/filter_page.dart';
import 'package:meal_app/pages/item_page.dart';
import 'package:meal_app/pages/meal_detail_page.dart';
import 'package:meal_app/pages/my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.pink,
          onPrimary: Colors.white,
          secondary: Colors.amber,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Color.fromARGB(255, 227, 234, 196),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 227, 234, 196),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      //home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(),
        CategoryPage.routeName: (ctx) => CategoryPage(),
        ItemPage.routeName: (ctx) => ItemPage(),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
        FavoritePage.routeName: (ctx) => FavoritePage(),
        FilteredPage.routeName: (ctx) => FilteredPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const ErrorPage(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const ErrorPage(),
        );
      },
    );
  }
}
