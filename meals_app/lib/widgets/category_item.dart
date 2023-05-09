import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_category_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  // final VoidCallbackAction bringCategoryMeals;

  // void bringCategoryMeals() {
  //   final String categoryId;
  //   MealsScreen(
  //       meals: dummyMeals, title: category.title, id: category.id);
  // }

  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      // splashColor: Theme.of(context).primaryColor,
      onTap: () {
        onSelectCategory();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.color,
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
      ),
    );
  }
}
