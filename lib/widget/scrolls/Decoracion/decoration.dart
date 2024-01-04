import 'package:flutter/material.dart';

class LineaHorizontal extends StatelessWidget {
  const LineaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1, // Altura de la línea
      color: Colors.grey, // Color de la línea
      margin: const EdgeInsets.all(20.0),
    );
  }
}
