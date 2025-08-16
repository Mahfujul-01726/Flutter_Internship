import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week3/controller/first_page_controller.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final FirstPageController controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("First Page")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter: ${controller.counter}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.increment();
                      },
                      child: const Text("Increment"),
                    ),
                    SizedBox(width: 32),
                    ElevatedButton(
                      onPressed: () {
                        controller.decrement();
                      },
                      child: const Text("Decrement"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Dialog Box'),
                        content: Text('This is a dialog box!'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Show Dialog'),
                ),
                SizedBox(height: 20),
                Image.asset('assets/images/cat.jpeg', height: 150, width: 158),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SecondPage(counter: controller.counter));
                  },
                  child: const Text("Go to Second Page"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
