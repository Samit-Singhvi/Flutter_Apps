import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key, required this.onSelectItem});

  void Function(String identifier) onSelectItem;

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Cooking up....',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: () {
            onSelectItem('meals');
          },
        ),
        ListTile(
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: () {
              onSelectItem('filters');
            })
      ]),
    );
  }
}
