import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  // Firebase Auth-Instanz
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Methode zum Login
  Future<void> _signInWithEmailPassword() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Versuche, den Benutzer mit Email und Passwort anzumelden
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Erfolgreicher Login, zurück zum HomeScreen und true zurückgeben
      Navigator.pop(context, true);
    } on FirebaseAuthException catch (e) {
      // Fehlerbehandlung, falls der Login fehlschlägt
      setState(() {
        _isLoading = false;
        _errorMessage = e.message; // Zeige die Fehlermeldung an
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // E-Mail Eingabe
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                border: OutlineInputBorder(),
                errorText:
                    _errorMessage == null ? null : 'Ungültige E-Mail-Adresse',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Passwort Eingabe
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Passwort',
                border: OutlineInputBorder(),
                errorText: _errorMessage == null ? null : 'Ungültiges Passwort',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            // Ladeindikator, falls der Login läuft
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _signInWithEmailPassword,
                  child: const Text('Einloggen'),
                ),

            // Fehlernachricht anzeigen, falls vorhanden
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
