import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite-page';

  final List<Meal> favoriteMeal;
  const FavoritePage({super.key, required this.favoriteMeal});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorite meal yet, start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
