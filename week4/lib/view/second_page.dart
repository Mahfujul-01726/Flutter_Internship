import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int counter;

  const SecondPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: const Text("Second Page")),
  body: Center(
    child: Text(
      "Received Counter: $counter",
      style: TextStyle(fontSize: 24),
    ),
  ),
);
  }
}
