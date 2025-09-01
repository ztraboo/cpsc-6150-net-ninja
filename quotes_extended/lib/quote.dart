import 'category.dart';

class Quote {
  final String text;
  final String author;
  // final Map<String, String> category;
  final Category category;
  final DateTime createdAt;
  final bool attributed;
  int likes;

  Quote({
    required this.text,
    required this.author,
    // this.category = const { Category.general:'General' }, // Defaults to general category.
    Category? category,
    DateTime? createdAt,
    this.likes = 0,
  }) : category = category ?? Category(type: Category.general, description: "General"),
       createdAt = createdAt ?? DateTime.now(), // Defaults to current date/time if not passed.
       attributed = (createdAt != null) ? true : false;

  // String get dateStr => DateFormat('MMM d, yyyy').format(this.createdAt);
}