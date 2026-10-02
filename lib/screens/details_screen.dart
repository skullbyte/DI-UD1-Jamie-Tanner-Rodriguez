import 'package:flutter/material.dart';

// --- AMPLIACIÓN 1: Segunda Pantalla ---
// Esta pantalla se abre al pulsar "Ver detalles" y se puede cerrar para volver.
class DetailsScreen extends StatelessWidget {
  final double basePrice;

  // Constructor que recibe un parámetro
  const DetailsScreen({super.key, required this.basePrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Juego'),
        backgroundColor: const Color(0xFF121212),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sports_esports, size: 100, color: Colors.blueAccent),
              const SizedBox(height: 20),
              const Text(
                'HOLLOW KNIGHT',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Desciende al mundo de Hallownest, un antiguo reino de insectos y héroes en ruinas. Explora cavernas serpenteantes, lucha contra criaturas corrompidas y hazte amigo de extraños insectos, todo en un estilo 2D clásico dibujado a mano.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Text(
                'Precio Final: ${basePrice.toStringAsFixed(2)} €',
                style: const TextStyle(fontSize: 24, color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              
              // --- AMPLIACIÓN 2: Otros tipos de botones ---
              
              // 3. OutlinedButton (Botón con borde y sin relleno de color)
              OutlinedButton.icon(
                onPressed: () {
                  print('Añadiendo al carrito...');
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text('Añadir al carrito', style: TextStyle(color: Colors.white)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blueAccent),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              
              const SizedBox(height: 15),
              
              // 4. TextButton (Botón plano solo con texto, ideal para acciones secundarias como "Cerrar")
              TextButton(
                onPressed: () {
                  // Cierra esta pantalla y vuelve a la anterior
                  Navigator.pop(context);
                },
                child: const Text('Cerrar detalles', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
      
      // 5. FloatingActionButton (Botón flotante redondo, muy típico en Material Design)
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Pulsaste el botón flotante'),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.share, color: Colors.white),
      ),
    );
  }
}
