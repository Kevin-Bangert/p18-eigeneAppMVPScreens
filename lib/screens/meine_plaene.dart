import 'package:flutter/material.dart';

class MeinePlaeneScreen extends StatelessWidget {
  const MeinePlaeneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meine Pläne"),
        backgroundColor: Colors.red[800],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // Beispiel: 5 vergangene Bestellungen
        itemBuilder: (context, index) {
          return _buildOrderCard();
        },
      ),
    );
  }

  // Methode zur Erstellung einer Bestellkarte
  Widget _buildOrderCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Platzhalter für das Bild
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Restaurant Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Burger • Fast Food",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.red[800],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Bestellt am 12. März 2024",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gesamt: 24,50 €",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.red[800]),
                  child: const Text("Erneut bestellen"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
