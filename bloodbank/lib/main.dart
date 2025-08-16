import 'package:flutter/material.dart';
import 'screens/donor_list_screen.dart';

void main() {
  runApp(const BloodBankApp());
}

class BloodBankApp extends StatelessWidget {
  const BloodBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const DonorListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
