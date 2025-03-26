import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Aktueller Index des ausgewählten Tabs
  int _selectedIndex = 0;

  // Firebase Auth – User eingeloggt Ja / Nein
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controller für die Suchleiste
  final TextEditingController _searchController = TextEditingController();

  //  User bereits angemeldet?
  bool get _isLoggedIn => _auth.currentUser != null;

  final List<Widget> _widgetOptions = <Widget>[
    SizedBox.shrink(),
    Center(child: Text('Meine Pläne', style: TextStyle(fontSize: 24))),
    Center(child: Text('Lieblinge', style: TextStyle(fontSize: 24))),
    SettingsScreen(), // Einstellungen-Screen
  ];

  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Zugriff aufs Theme -> NACHDEM widget Baum fertiggestellt wurde
    _theme = Theme.of(context);
    _widgetOptions[0] = _buildHomeContent();
  }

  // Startseite wird gebaut
  Widget _buildHomeContent() {
    return CustomScrollView(
      slivers: [
        // Suchleiste oben
        SliverAppBar(
          floating: true,
          snap: true,
          title: Container(
            height: 45,
            decoration: BoxDecoration(
              color: _theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: _theme.iconTheme.color),
                hintText: 'Restaurant oder Küche suchen',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Nur für mich in der Konsole
                print('Suchanfrage: $value');
              },
            ),
          ),
        ),
        // Horizontale Liste mit Kategorien (wie Essen, Supermarkt etc.)
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
        // Liste der Restaurantkarten
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildRestaurantCard(),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }

  // Baut ein einzelnes Kategoriefeld
  Widget _buildCategory(IconData icon, String text) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: _theme.colorScheme.primary.withOpacity(0.1),
            child: Icon(icon, color: _theme.colorScheme.primary, size: 30),
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

  // Beispiel Restaurantkarte
  Widget _buildRestaurantCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Platzhalter Bild
          Container(height: 150, width: double.infinity, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Restaurant Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Restaurantkategorie & Preis
                Row(
                  children: [
                    Text(
                      'Italienisch • Pizza',
                      style: TextStyle(
                        color: _theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, size: 4, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      '€€',
                      style: TextStyle(
                        color: _theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //  Lieferinformationen
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      color: _theme.colorScheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Kostenlos • Min. €10',
                      style: TextStyle(
                        color: _theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.access_time,
                      color: _theme.colorScheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '20-30 Min.',
                      style: TextStyle(
                        color: _theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
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

  // Wird aufgerufen, wenn ein Tab in der unteren Navigation angeklickt wird
  void _onItemTapped(int index) async {
    if (index == 3 && !_isLoggedIn) {
      // Wenn der User den Einstellungen-Tab klickt und nicht eingeloggt ist,
      // leite ihn zum LoginScreen weiter
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      // Falls der Login erfolgreich war, setze den Tab auf Einstellungen
      if (result == true) {
        setState(() {
          _selectedIndex = 3;
        });
      }
    } else {
      // Andernfalls einfach den ausgewählten Tab wechseln
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Dynamischer Titel für die AppBar
  String _getAppBarTitle(int index) {
    switch (index) {
      case 1:
        return 'Meine Pläne';
      case 2:
        return 'Lieblinge';
      case 3:
        return 'Einstellungen';
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar nur anzeigen, wenn wir nicht auf der Home-Seite sind
      appBar:
          _selectedIndex == 0
              ? null
              : AppBar(title: Text(_getAppBarTitle(_selectedIndex))),
      body: _widgetOptions[_selectedIndex],
      //  Bottom Navigation mit Icons
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
            icon: Icon(Icons.settings),
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
