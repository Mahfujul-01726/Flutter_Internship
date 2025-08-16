import 'package:flutter/material.dart';
import '../models/game.dart';

class GameController extends ChangeNotifier {
  List<Game> _games = [];
  bool _isLoading = false;
  String? _error;

  List<Game> get games => _games;
  bool get isLoading => _isLoading;
  String? get error => _error;

  GameController() {
    loadGames();
  }

  Future<void> loadGames() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      _games = _getMockGames();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load games: $e';
      _isLoading = false;
    }
    
    notifyListeners();
  }

  Game? getGameById(String id) {
    try {
      return _games.firstWhere((game) => game.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Game> _getMockGames() {
    return [
      Game(
        id: '1',
        title: 'Lorem Ipsum',
        description: 'Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh. Et elementum enim at enim montes aliquam elit pellentesque nulla. Eget urna turpis nunc diam facilisis facilisis tempus. Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh.',
        rating: 4.1,
        downloads: '82k',
        size: '456 kb',
        imageUrl: 'assets/images/game1.png',
        features: [
          'Et elementum enim at',
          'enim montes aliquam',
          'elit pellentesque'
        ],
      ),
      Game(
        id: '2',
        title: 'Lorem Ipsum',
        description: 'Action-packed racing game with stunning graphics and realistic physics.',
        rating: 3.8,
        downloads: '22k',
        size: '234 kb',
        imageUrl: 'assets/images/game2.png',
        features: [
          'High-speed racing',
          'Multiple tracks',
          'Customizable cars'
        ],
      ),
      Game(
        id: '3',
        title: 'Lorem Ipsum',
        description: 'Fun puzzle game that challenges your mind with creative solutions.',
        rating: 4.2,
        downloads: '71k',
        size: '123 kb',
        imageUrl: 'assets/images/game3.png',
        features: [
          'Brain training',
          'Multiple levels',
          'Daily challenges'
        ],
      ),
      Game(
        id: '4',
        title: 'Lorem Ipsum',
        description: 'Adventure game with magical creatures and epic quests.',
        rating: 4.0,
        downloads: '50k',
        size: '567 kb',
        imageUrl: 'assets/images/game4.png',
        features: [
          'Epic adventures',
          'Magical world',
          'Character progression'
        ],
      ),
    ];
  }
}