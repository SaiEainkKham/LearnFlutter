import 'package:flutter/material.dart';

import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/error_page.dart';
import 'package:meal_app/pages/favorite_page.dart';
import 'package:meal_app/pages/filter_page.dart';
import 'package:meal_app/pages/item_page.dart';
import 'package:meal_app/pages/meal_detail_page.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/pages/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeal.any((meal) => meal.id == mealId);
  }

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
        '/': (ctx) => MyHomePage(favoriteMeal: _favoriteMeal),
        CategoryPage.routeName: (ctx) => CategoryPage(),
        ItemPage.routeName: (ctx) => ItemPage(availableMeals: _availableMeal),
        MealDetailPage.routeName: (ctx) => MealDetailPage(
            isFavorite: isMealFavorite, toggleFavorite: _toggleFavorite),
        FavoritePage.routeName: (ctx) =>
            FavoritePage(favoriteMeal: _favoriteMeal),
        FilteredPage.routeName: (ctx) =>
            FilteredPage(saveFilter: _setFilters, currentFilter: _filters),
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
