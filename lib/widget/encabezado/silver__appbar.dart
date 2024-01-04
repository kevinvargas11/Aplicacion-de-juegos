import 'package:appgames/temascolores/decoracion_sombreado.dart';
import 'package:appgames/widget/encabezado/iconosearch.dart';
import 'package:flutter/material.dart';

class SliverAppBarClass extends StatelessWidget {
  const SliverAppBarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 450,
      actions: const [IconoSearch()],
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            title: const Text("GAMESVIN"),
            background: Image.network(
              "https://images.unsplash.com/photo-1519681393784-d120267933ba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8MTkyMCUyMHglMjAxMDgwfGVufDB8fDB8fHww",
              fit: BoxFit.cover,
            ),
          ),
          const Sombreado(),
        ],
      ),
    );
  }
}
