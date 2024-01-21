import 'package:flutter/material.dart';
import 'package:arusuvai/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // we'll get nice visual feedback form InkWell widget but not in GestureDetector widget
      onTap: onSelectCategory,
      // Passing function as value
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8), //16
      child: Container(
        padding: const EdgeInsets.all(8), //16
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), //Actually 16
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
