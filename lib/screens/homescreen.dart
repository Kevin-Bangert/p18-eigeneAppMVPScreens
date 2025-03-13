import 'package:flutter/material.dart';
import 'register.dart'; // Importiere den RegisterScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false; // Simulierter Login-Status

  final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Meine Pläne', style: TextStyle(fontSize: 24))),
    const Center(
      child: Text('Lieblinge', style: TextStyle(fontSize: 24)),
    ), // Profil-Screen (nur wenn eingeloggt)
    const Center(child: Text('Ich', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    if (index == 3 && !_isLoggedIn) {
      // Falls der Nutzer nicht eingeloggt ist und auf "Ich" klickt
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Damit 4 Icons angezeigt werden
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration),
            label: "Meine Pläne",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: "Lieblinge",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: "Einstellungen",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
