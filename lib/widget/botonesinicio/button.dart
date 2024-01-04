import 'package:appgames/pantallas/main_emu_pantalla.dart';
import 'package:appgames/pantallas/main_nin_pantalla.dart';
import 'package:appgames/pantallas/main_ps2_pantalla.dart';
import 'package:appgames/pantallas/main_psp_pantalla.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class ButtonSty extends StatelessWidget {
  const ButtonSty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPspPantalla()),
              );

              // Acción a realizar cuando se toca el botón
              // Puedes agregar aquí cualquier lógica adicional que desees ejecutar al tocar
            },
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              strokeWidth: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              radius: const Radius.circular(8),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.gamepad_outlined),
                  SizedBox(width: 8.0),
                  Text('PSP',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          //xdxddxdx
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPs2Pantalla()),
              );

              // Acción a realizar cuando se toca el botón
              // Puedes agregar aquí cualquier lógica adicional que desees ejecutar al tocar
            },
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              strokeWidth: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              radius: const Radius.circular(8),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.gamepad_outlined),
                  SizedBox(width: 8.0),
                  Text('PS2',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8.0),

          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainNinPantalla()),
              );

              // Acción a realizar cuando se toca el botón
              // Puedes agregar aquí cualquier lógica adicional que desees ejecutar al tocar
            },
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              strokeWidth: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              radius: const Radius.circular(8),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.gamepad_outlined),
                  SizedBox(width: 8.0),
                  Text('NIN',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8.0),

          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainEmuPantalla()),
              );

              // Acción a realizar cuando se toca el botón
              // Puedes agregar aquí cualquier lógica adicional que desees ejecutar al tocar
            },

            // Color de resaltado al tocar el botón
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              strokeWidth: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              radius: const Radius.circular(8),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.gamepad_outlined),
                  SizedBox(width: 8.0),
                  Text('EMU',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
