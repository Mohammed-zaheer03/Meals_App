import 'package:flutter/material.dart';

import 'package:arusuvai/models/meal.dart';
import 'package:arusuvai/models/category.dart';
import 'package:arusuvai/data/dummy_data.dart';
import 'package:arusuvai/screens/meals.dart';
import 'package:arusuvai/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // where((element) => true) is a built-in function used for all lists in dart.
    // Automatically takes each element to check condition
    // Similarly, contains(element) is a built-in function for all lists.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
    // Alternative way of achieving page navigation using
    // Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // To set number of columns need in Grid view
        crossAxisCount: 2,
        childAspectRatio:
            3 / 2, // This will impact the sizing of those GridView items
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: <Widget>[
        // Alternative way
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              })
      ],
    );
  }
}
