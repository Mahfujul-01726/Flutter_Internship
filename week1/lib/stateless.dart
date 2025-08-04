import 'package:flutter/material.dart';

// Main function to run the app
void main() => runApp(const MyApp());

// MyApp is a stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Build method to create the widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
      // Disable debug banner
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            
            // Icon color
            color: Colors.white, 
          ), 
          
          // Menu icon on the left
          
          // Green background color for AppBar
          backgroundColor: Colors.green, 
          title: const Text(
            
            // Title text
            "GeeksforGeeks", 
            
            // Text style
            style: TextStyle(color: Colors.white), 
          ),
        ), // AppBar
        body: const Center(
          child: Text(
              
            // Center text
            "Stateless Widget",
            
            // Text style
            style: TextStyle(color: Colors.black, fontSize: 30), 
          ),
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}