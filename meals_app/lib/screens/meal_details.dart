import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  MealsDetailsScreen({super.key, required this.meal});

  Meal meal;
  Widget build(BuildContext context, WidgetRef ref) {
    String step, ingredient;
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: iconThemeClicked),
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleSelectedFavorite(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? "Meal was added"
                        : "Meal was removed, click again to add")));
              },
              icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Image.network(meal.imageUrl),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (step in meal.steps)
              Text(
                step,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.center,
              ),
          ],
        )),
      ),
    );
  }
}
