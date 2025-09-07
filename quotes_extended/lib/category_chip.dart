import 'package:flutter/material.dart';
import 'category.dart';

class CategoryChip extends StatelessWidget {
  /*
  Material Chip that puts a date icon to the left of a category.
   */
  final Category category;

  const CategoryChip({
    required this.category
  });

  IconData _iconForCategoryOrigin(CategoryOrigin categoryOrigin) {
    switch (categoryOrigin) {
      case CategoryOrigin.none:
        return Icons.add;
      case CategoryOrigin.location:
        return Icons.gps_fixed;
      case CategoryOrigin.publication:
        return Icons.description_outlined;
      case CategoryOrigin.speech:
        return Icons.location_history_sharp;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("${category.genre}, ${category.origin}, ${category.description}");

    return Chip(
      backgroundColor: Colors.grey.shade800,
      // Left icon inside the chip
      avatar: Icon(
        _iconForCategoryOrigin(category.origin),
        size: 18,
        color: Colors.grey.shade200,
      ),
      label: Text(
        (category.origin == CategoryOrigin.publication) ? '"${category.description}"' : category.description,
        style: TextStyle(
            color: Colors.grey.shade200,
            fontStyle: (category.origin == CategoryOrigin.publication) ? FontStyle.italic : FontStyle.normal,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }
}
