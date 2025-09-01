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

  IconData _iconForCategory(String categoryType) {
    switch (categoryType) {
      case Category.general:
        return Icons.add;
      case Category.location:
        return Icons.gps_fixed;
      case Category.play:
        return Icons.description_outlined;
      default:
        return Icons.help_outline; // safe fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    print("${category.type}");

    return Chip(
      backgroundColor: Colors.grey.shade800,
      // Left icon inside the chip
      avatar: Icon(
        _iconForCategory(category.type),
        size: 18,
        color: Colors.grey.shade200,
      ),
      label: Text(
        (category.type == Category.play) ? '"${category.description}"' : category.description,
        style: TextStyle(
            color: Colors.grey.shade200,
            fontStyle: (category.type == Category.play) ? FontStyle.italic : FontStyle.normal,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }
}
