import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_category_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  Widget build(BuildContext context) {
    for (Meal meal in meals) {
      print(meal.ingredients);
    }
    Widget content = ListView.builder(
      itemBuilder: (ctx, idx) => MealItem(
        meal: meals[idx],
      ),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(children: [
          Text("Uh oh !! Nothing here",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 14,
          ),
          Text("Select any other Category....",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ))
        ]),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
