import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_category_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  void _onSelectCategory(BuildContext context, title, idSelected) {
    print(title + " " + idSelected);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: title,
              meals: availableMeal
                  .where((element) => element.categories.contains(idSelected))
                  .toList(),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Choose the category')),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 8),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _onSelectCategory(context, category.title, category.id);
              },
            )
        ],
      ),
    );
  }
}
