import 'category.dart';

class Quote {
  final String text;
  final String author;
  // final Map<String, String> category;
  final Category category;
  final DateTime createdAt;
  final bool createdAtExists;
  final String? historicalDate;
  final bool historicalDateExists;
  int likes;

  Quote({
    required this.text,
    required this.author,
    // this.category = const { Category.general:'General' }, // Defaults to general category.
    Category? category,
    DateTime? createdAt,
    String? historicalDate,
    this.likes = 0
  }) : category = category ?? Category(genre: CategoryGenre.general, origin: CategoryOrigin.none, description: "General"),
       createdAt = createdAt ?? DateTime.now(), // Defaults to current date/time if not passed.
       createdAtExists = (createdAt != null) ? true : false,
       historicalDate = historicalDate ?? "",
       historicalDateExists = (historicalDate == null || historicalDate.isEmpty) ? false : true;

  // String get dateStr => DateFormat('MMM d, yyyy').format(this.createdAt);
}