class Game {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final String downloads;
  final String size;
  final List<String> features;

  Game({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.downloads,
    required this.size,
    required this.features,
  });
}