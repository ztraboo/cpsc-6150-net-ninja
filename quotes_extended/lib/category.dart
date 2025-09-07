enum CategoryGenre { general, humor, inspiration }
enum CategoryOrigin { none, location, publication, speech }

class Category {
  final CategoryGenre genre;  // Provides a way to distinguish the quote genres.
  final CategoryOrigin origin; // Provides a way to add first appearance of the quote.
  final String description;

  Category({
    this.genre = CategoryGenre.general,
    this.origin = CategoryOrigin.none,
    this.description = ""
  });
}