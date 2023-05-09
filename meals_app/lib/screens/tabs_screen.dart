import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_category_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<Filters, bool> _selectedFilters = kInitialFilters;

  // void _showInfoMessage(message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void onSelectItem(identifier) async {
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => FilterScreen(
                currentFilters: _selectedFilters,
              )));

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeal: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: SideDrawer(
        onSelectItem: onSelectItem,
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: BottomNavigationBar(
          onTap: _selectPage,
          iconSize: 17,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_rounded), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ],
        ),
      ),
    );
  }
}
