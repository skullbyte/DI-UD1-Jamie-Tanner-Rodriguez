import 'package:flutter/material.dart';
import 'package:catalogo_videojuego/widgets/game_card.dart';

// Pantalla principal que solo sirve para centrar nuestra tarjeta.
class GameCardScreen extends StatelessWidget {
  const GameCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: const GameCard(),
          ),
        ),
      ),
    );
  }
}
