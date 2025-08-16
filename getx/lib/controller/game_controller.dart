import 'package:get/get.dart';
import 'package:getx/model/game.dart';
import 'package:getx/model/game_data.dart';

class GameController extends GetxController {
  List<Game> games = GameData.gameList;
  
  void playGame(String gameId) {
    // Handle play game action
    Get.snackbar('Game Started', 'Playing game with ID: $gameId');
  }
}