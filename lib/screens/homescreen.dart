import 'package:flutter/material.dart';
import 'register.dart';

// Die Hauptklasse für den Home-Bildschirm
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Speichert den aktuell ausgewählten Tab
  bool _isLoggedIn = false; // Simuliert, ob der Benutzer eingeloggt ist

  // Liste der Inhalte für die verschiedenen Tabs
  final List<Widget> _widgetOptions = <Widget>[
    _buildHomeContent(), // Startseite mit Restaurantübersicht
    const Center(child: Text('Meine Pläne', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Lieblinge', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Ich', style: TextStyle(fontSize: 24))),
  ];

  // Methode zum Erstellen des Home-Tabs
  static Widget _buildHomeContent() {
    return CustomScrollView(
      slivers: [
        // Suchleiste im oberen Bereich
        SliverAppBar(
          floating: true,
          snap: true,
          title: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Restaurant oder Küche suchen',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        // Horizontale Liste mit Kategorien (z.B. Pizza, Supermarkt)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory(Icons.fastfood, 'Essen'),
                  _buildCategory(Icons.shopping_basket, 'Supermarkt'),
                  _buildCategory(Icons.local_pizza, 'Pizza'),
                  _buildCategory(Icons.ramen_dining, 'Asiatisch'),
                  _buildCategory(Icons.cake, 'Dessert'),
                ],
              ),
            ),
          ),
        ),
        // Liste der Restaurants
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  _buildRestaurantCard(), // Erzeugt Restaurantkarten
              childCount: 10, // Anzahl der angezeigten Restaurants
            ),
          ),
        ),
      ],
    );
  }

  // Methode zum Erstellen einer einzelnen Kategorie (z.B. Pizza, Supermarkt)
  static Widget _buildCategory(IconData icon, String text) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red[50],
            child: Icon(icon, color: Colors.red[800], size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Methode zum Erstellen einer Restaurantkarte
  static Widget _buildRestaurantCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Platzhalter für das Bild (weißes Feld)
          Container(height: 150, width: double.infinity, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurantname
                const Text(
                  'Restaurant Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Restaurantkategorie und Preisspanne
                Row(
                  children: [
                    Text(
                      'Italienisch • Pizza',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, size: 4, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('€€', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                const SizedBox(height: 8),
                // Lieferdetails
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.red[800],
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Kostenlos • Min. €10',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, color: Colors.red[800], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '20-30 Min.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Methode, die aufgerufen wird, wenn ein Tab in der Navigation angeklickt wird
  void _onItemTapped(int index) {
    if (index == 3 && !_isLoggedIn) {
      // Falls der Benutzer nicht eingeloggt ist und auf „Ich“ klickt, wird er zur Registrierung weitergeleitet
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    } else {
      // Wechselt den aktuellen Tab
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? null : AppBar(title: const Text("Home")),
      body: _widgetOptions[_selectedIndex], // Zeigt den aktuellen Tab an
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
