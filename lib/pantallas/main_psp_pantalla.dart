import 'package:appgames/temascolores/letras_dise.dart';
import 'package:appgames/widget/botonesinicio/button.dart';
import 'package:appgames/widget/encabezado/silver__appbar.dart';
import 'package:appgames/widget/scrolls/Decoracion/decoration.dart';
import 'package:appgames/widget/scrolls/scrollspsp/Publicidad/publicidad_scroll.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scoll_estrategia.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll.deportes.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_actions.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_carreras.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_peleas.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_terror.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_top10.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainPspPantalla extends StatelessWidget {
  const MainPspPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBarClass(),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlueAccent.withOpacity(0.5),
                    const Color(0xFF2D2E40).withOpacity(0.8),
                  ],
                  stops: const [
                    0.0,
                    0.2
                  ], // Ajusta la posición de los colores según tus preferencias
                ),
              ),
              child: Column(
                children: [
                  const Gap(80),
                  const HorizontalNoticias(),
                  const Gap(50),
                  const ButtonSty(),
                  const Gap(50),
                  buildSection(
                      ("TOP 10"), const LineaHorizontal(), const ScrollTop()),
                  buildSection("ACTIONS", const LineaHorizontal(),
                      const ScrollActions()),
                  buildSection(
                      "PELEAS", const LineaHorizontal(), const ScrollPelea()),
                  buildSection("DEPORTES", const LineaHorizontal(),
                      const ScrollDeporte()),
                  buildSection("CARRERAS", const LineaHorizontal(),
                      const ScrollCarreras()),
                  buildSection(
                      "TERROR", const LineaHorizontal(), const ScrollTerror()),
                  buildSection("ESTRATEGIA", const LineaHorizontal(),
                      const ScrollEstrategia()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
