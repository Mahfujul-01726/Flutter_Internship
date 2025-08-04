import 'package:get/get.dart';

class SecondPageController extends GetxController {
  int counter = 0;

  void incrementCounter() {
    counter++;
    update();
  }
}
