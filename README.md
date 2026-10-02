# Proyecto: Tarjeta de Videojuego en Flutter

Este proyecto es una práctica de Desarrollo de Interfaces implementada en Flutter (Dart).
Consiste en la creación de una "Tarjeta de Videojuego" para un catálogo digital, basada en un diseño previo de Figma (Hollow Knight).

## Características del Proyecto (Fases 1, 2 y 3)

1. **Diseño Visual**: Réplica exacta de los márgenes, fuentes, paleta de colores y bordes redondeados del diseño de Figma usando `Container`, `Stack`, `Positioned`, `Column` y `Row`.
2. **Imágenes Locales**: La imagen principal se carga desde la carpeta local `assets/` y está configurada en `pubspec.yaml`.
3. **Código Explicado**: Todo el archivo `lib/main.dart` ha sido **comentado línea por línea** pensando en desarrolladores que recién están empezando con Flutter. Explica para qué sirve cada Widget (como `Scaffold`, `StatelessWidget`, `StatefulWidget`, etc.).
4. **Interactividad (Fase 3)**:
    - **Botón `onPressed`**: Al pulsar "Ver detalles" (`ElevatedButton`), se llama a una función con parámetros `_calculateDiscount(20.0)` que calcula un descuento y lo muestra por consola (`print`).
    - **Callback directo e IconButton**: El icono de corazón (`IconButton`) llama directamente a la función `_toggleFavorite`, que cambia el estado interno para pintar el corazón de rojo.
    - **GestureDetector**: Al hacer click encima de la imagen superior del juego, se detecta el toque y muestra un mensaje por consola.

## Cómo ejecutar

Simplemente ejecuta el siguiente comando en la raíz del proyecto para lanzar la app en el emulador:

```bash
flutter run
```
