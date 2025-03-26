import 'package:eatsup/firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Definiere das globale App-Theme
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.blueAccent,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.grey[600], fontSize: 14),
          bodySmall: TextStyle(color: Colors.grey[400], fontSize: 12),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
