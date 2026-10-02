import 'package:flutter/material.dart';
import 'package:catalogo_videojuego/screens/details_screen.dart';

// GameCard es un StatefulWidget porque queremos que la interfaz cambie (favoritos).
class GameCard extends StatefulWidget {
  const GameCard({super.key});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool _isFavorite = false;
  final double _basePrice = 14.79;

  // --- REQUISITO 2: Función utilizada directamente como callback ---
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    print('Estado de favorito cambiado a: $_isFavorite');
  }

  // --- AMPLIACIÓN 1: Navegación a Segunda Pantalla ---
  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(basePrice: _basePrice),
      ),
    );
  }

  // --- AMPLIACIÓN 3: Otros gestos en GestureDetector ---
  void _onImageDoubleTap() {
    print('Doble toque en la imagen. ¡Añadido a favoritos rápido!');
    _toggleFavorite();
  }

  void _onImageLongPress() {
    print('Pulsación larga en la imagen detectada.');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Hollow Knight: Juego de acción y aventura 2D')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // --- AMPLIACIÓN 3: GestureDetector con múltiples gestos ---
          GestureDetector(
            onTap: () => print('Se ha pulsado sobre la imagen (un toque).'),
            onDoubleTap: _onImageDoubleTap, // Nuevo gesto: Doble toque
            onLongPress: _onImageLongPress, // Nuevo gesto: Pulsación larga
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    'assets/hollow_knight.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, color: Colors.blueAccent, size: 10),
                        SizedBox(width: 5),
                        Text(
                          'NUEVO LANZAMIENTO',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'PC',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HOLLOW KNIGHT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      child: const Text(
                        'METROIDVANIA',
                        style: TextStyle(fontSize: 10, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'UN JUGADOR',
                      style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EDICIÓN ESTÁNDAR',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${_basePrice.toStringAsFixed(2)} €',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            5, 
                            (index) => const Icon(Icons.star_border, color: Colors.blueAccent, size: 16)
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '5 - 2,184 reseñas',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // --- BOTONES DE LA TARJETA ---
                Row(
                  children: [
                    Expanded(
                      // 1. ElevatedButton (Botón principal con fondo)
                      child: ElevatedButton(
                        onPressed: () => _openDetails(context), 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ver detalles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // 2. IconButton (Botón de icono sin borde)
                      child: IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border, 
                          color: _isFavorite ? Colors.red : Colors.white
                        ),
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
}
