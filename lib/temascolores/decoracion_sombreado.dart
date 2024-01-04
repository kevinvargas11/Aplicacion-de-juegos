import 'package:flutter/material.dart';

class Sombreado extends StatelessWidget {
  const Sombreado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.blue,
            ],
            stops: [
              0.45, // Comienza la transición hacia el negro en la parte inferior
              1.0, // Llega al negro al final de la pantalla
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, // Gradiente hacia abajo
          ),
        ),
      ),
    );
  }
}
