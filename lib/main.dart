import 'package:appgames/pantallas/pantalla_principal.dart';
import 'package:appgames/temascolores/temas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Temas().getTema(),
      home: const MainPantalla(),
    );
  }
}
