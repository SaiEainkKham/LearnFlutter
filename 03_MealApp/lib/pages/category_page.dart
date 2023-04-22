import 'package:flutter/material.dart';

import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/data/dummy_data.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((data) {
          return CategoryItem(
            title: data.title,
            color: data.color,
          );
        }).toList(),
      ),
    );
  }
}
