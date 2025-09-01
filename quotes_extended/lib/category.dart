class Category {
  static const String general = "general";
  static const String play = "play";
  static const String location = "location";

  final String type;
  final String description;

  Category({
    required this.type, required this.description
  });
}