import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail-page';
  const MealDetailPage({super.key});

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildListContainer(Widget subWidget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 350,
      child: subWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle('Ingredients', context),
            _buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  //color: Theme.of(context).colorScheme.secondary,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle('Steps', context),
            _buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                    )
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
