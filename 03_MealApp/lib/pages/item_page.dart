import 'package:flutter/material.dart';

import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/models/meal.dart';

class ItemPage extends StatefulWidget {
  static const routeName = '/item-page';

  final List<Meal> availableMeals;
  const ItemPage({super.key, required this.availableMeals});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle as String),
          //automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
            );
          },
          itemCount: displayedMeals?.length,
        ));
  }
}
