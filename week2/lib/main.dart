/* import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Navigator Demo', home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Back to First Page"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Navigator Demo', home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Go to Second Page",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Back to First Page",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Root widget of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Demo',
      home: FirstPage(), // First screen of the app
    );
  }
}

// =========================
// First Page
// =========================
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        // Center takes only ONE widget, so we use child:
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column takes MULTIPLE widgets, so we use children:
          children: [
            Text("Welcome to First Page", style: TextStyle(fontSize: 20)),

            SizedBox(height: 20), // Space between widgets

            GestureDetector(
              onTap: () {
                // Navigate to SecondPage when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },

              // GestureDetector takes only one widget -> use child:
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),

                // Container takes only one widget inside -> child:
                child: Text(
                  "Go to Second Page",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// Second Page
// =========================
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Second Page", style: TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                // Go back to the FirstPage
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Back to First Page",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Starting point of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row & Column Demo',
      home: FirstPage(), // Sets FirstPage as the home screen
    );
  }
}

// =========================
// First Page
// =========================
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Text("Welcome to First Page", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            // Row inside Column
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center horizontally
              children: [
                Icon(Icons.home, color: Colors.blue),
                SizedBox(width: 10), // Space between icon and text
                Text("This is inside a Row", style: TextStyle(fontSize: 16)),
              ],
            ),

            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Go to Second Page",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// Second Page
// =========================
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Second Page", style: TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            // Row inside Column
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, color: Colors.red),
                SizedBox(width: 10),
                Text("Back Button Below", style: TextStyle(fontSize: 16)),
              ],
            ),

            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Back to First Page",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Scroll + Row & Column Demo', home: FirstPage());
  }
}

// =========================
// First Page
// =========================
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: SingleChildScrollView(
        // Makes everything scrollable if needed
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              Text("Welcome to First Page", style: TextStyle(fontSize: 20)),

              SizedBox(height: 20),

              // Row inside Column
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("This is inside a Row", style: TextStyle(fontSize: 16)),
                ],
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Go to Second Page",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 40), // Add bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}

// =========================
// Second Page
// =========================
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: SingleChildScrollView(
        // Also scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              Text("Welcome to Second Page", style: TextStyle(fontSize: 20)),

              SizedBox(height: 20),

              // Row inside Column
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, color: Colors.red),
                  SizedBox(width: 10),
                  Text("Back Button Below", style: TextStyle(fontSize: 16)),
                ],
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Back to First Page",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // App Entry Point
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Increment-Decrement',
      home: FirstPage(),
    );
  }
}

// =========================
// First Page - Stateful Widget
// =========================
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int counter = 0; // Initial count value

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text("Welcome to First Page", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),

              // Row with Icon and Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("This is inside a Row"),
                ],
              ),
              SizedBox(height: 30),

              // ========================
              // Counter Display
              // ========================
              Text(
                "Counter: $counter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Increment-Decrement Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Decrement Button
                  GestureDetector(
                    onTap: _decrement,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),

                  // Increment Button
                  GestureDetector(
                    onTap: _increment,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Go to Second Page Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Go to Second Page",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================
// Second Page - StatelessWidget
// =========================
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text("Welcome to Second Page", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, color: Colors.red),
                  SizedBox(width: 10),
                  Text("Back Button Below"),
                ],
              ),
              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Back to First Page",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
