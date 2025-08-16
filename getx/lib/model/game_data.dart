import 'package:getx/model/game.dart';

class GameData {
  static List<Game> gameList = [
    Game(
      id: "1",
      title: "Lorem Ipsum",
      description: "Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh. Et elementum enim at enim montes aliquam elit pellentesque nulla. Eget urna turpis nunc diam facilisis facilisis tempus. Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh.",
      imageUrl: "ava1.webp",
      rating: 4.1,
      downloads: "82k",
      size: "456 kb",
      features: [
        "Et elementum enim at",
        "enim montes aliquam",
        "elit pellentesque"
      ],
    ),
    Game(
      id: "2", 
      title: "Lorem Ipsum",
      description: "Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh. Et elementum enim at enim montes aliquam elit pellentesque nulla.",
      imageUrl: "ava2.webp",
      rating: 3.8,
      downloads: "22k", 
      size: "234 kb",
      features: [
        "Et elementum enim at",
        "enim montes aliquam",
        "elit pellentesque"
      ],
    ),
    Game(
      id: "3",
      title: "Lorem Ipsum", 
      description: "Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh.",
      imageUrl: "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=400&h=300&fit=crop",
      rating: 4.2,
      downloads: "71k",
      size: "512 kb", 
      features: [
        "Et elementum enim at",
        "enim montes aliquam",
        "elit pellentesque"
      ],
    ),
    Game(
      id: "4",
      title: "Lorem Ipsum",
      description: "Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio.",
      imageUrl: "https://images.unsplash.com/photo-1556438064-2d7646166914?w=400&h=300&fit=crop", 
      rating: 4.0,
      downloads: "50k",
      size: "678 kb",
      features: [
        "Et elementum enim at",
        "enim montes aliquam", 
        "elit pellentesque"
      ],
    ),
    Game(
      id: "5",
      title: "Lorem Ipsum",
      description: "Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh.",
      imageUrl: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=400&h=300&fit=crop",
      rating: 4.1,
      downloads: "82k",
      size: "456 kb",
      features: [
        "Et elementum enim at",
        "enim montes aliquam",
        "elit pellentesque"
      ],
    ),
  ];
}