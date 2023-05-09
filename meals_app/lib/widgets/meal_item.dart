import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal});

  void openMealDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(
              meal: meal,
            )));
  }

  Meal meal;
  Widget build(BuildContext context) {
    print(meal.toString());
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          openMealDetails(context);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealsDataScreen(
                              label: '${meal.duration} min',
                              icon: Icons.schedule),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsDataScreen(
                              label: meal.affordability.name.toUpperCase(),
                              icon: Icons.attach_money),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsDataScreen(
                              label: meal.complexity.name.toUpperCase(),
                              icon: Icons.work)
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
