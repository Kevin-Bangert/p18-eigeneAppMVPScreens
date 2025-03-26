import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Einstellungen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Benutzereinstellungen",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Profil bearbeiten"),
              onTap: () {
                // Hier kannst du eine Methode oder einen neuen Screen für Profilbearbeitung einfügen
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Benachrichtigungen"),
              onTap: () {
                // Hier kannst du eine Methode oder einen neuen Screen für Benachrichtigungseinstellungen einfügen
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text("Sicherheit"),
              onTap: () {
                // Hier kannst du eine Methode oder einen neuen Screen für Sicherheitseinstellungen einfügen
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Abmelden"),
              onTap: () {
                // Hier kannst du die Abmeldefunktion einfügen
                // Beispiel: FirebaseAuth.instance.signOut();
                // Navigator.pop(context); -> Zurück zum vorherigen Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
