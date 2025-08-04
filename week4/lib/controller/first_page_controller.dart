import 'package:get/get.dart';

class FirstPageController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    update(); // Notify UI
  }

  void decrement() {
    _counter--;
    update(); // Notify UI
  }
}
