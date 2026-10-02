import 'package:flutter/material.dart';
import 'package:catalogo_videojuego/screens/game_card_screen.dart';

// Punto de entrada principal de la aplicación.
void main() {
  runApp(const MyApp());
}

// MyApp es el widget principal que envuelve a toda la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Videojuegos',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home: const GameCardScreen(),
    );
  }
}
