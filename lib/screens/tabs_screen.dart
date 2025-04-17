import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/nav_bar_provider.dart';
import '../providers/favourites_provider.dart';
import '../providers/filters_provider.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    final int selectedIndex = ref.watch(navBarProvider);
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = 'Pick your category';

    if (selectedIndex == 1) {
      final List<Meal> favouriteMeal = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(meals: favouriteMeal);
      activePageTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => FiltersScreen()),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
