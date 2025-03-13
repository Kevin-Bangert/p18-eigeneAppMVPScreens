import 'package:flutter/material.dart';
import 'screens/homescreen.dart'; // StartScreen importieren

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // App startet mit StartScreen
    );
  }
}
