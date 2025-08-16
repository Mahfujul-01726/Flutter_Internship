class Game {
  final String id;
  final String title;
  final String description;
  final double rating;
  final String downloads;
  final String size;
  final String imageUrl;
  final List<String> features;

  Game({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.downloads,
    required this.size,
    required this.imageUrl,
    required this.features,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      downloads: json['downloads'],
      size: json['size'],
      imageUrl: json['imageUrl'],
      features: List<String>.from(json['features']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rating': rating,
      'downloads': downloads,
      'size': size,
      'imageUrl': imageUrl,
      'features': features,
    };
  }
}