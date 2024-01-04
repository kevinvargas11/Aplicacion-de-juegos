import 'package:appgames/datasource/Noticia_data.dart';
import 'package:appgames/datasource/actions_data.dart';
import 'package:appgames/datasource/carreras_data.dart';
import 'package:appgames/datasource/deportes_data.dart';
import 'package:appgames/datasource/estrategia_data.dart';
import 'package:appgames/datasource/peleas_data.dart';
import 'package:appgames/datasource/terror_data.dart';
import 'package:appgames/datasource/top10_data.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scoll_estrategia.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll.deportes.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_actions.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_carreras.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_peleas.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_promocion.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_terror.dart';
import 'package:appgames/widget/scrolls/scrollspsp/scroll_top10.dart';
import 'package:flutter/material.dart';

class IconoSearch extends StatelessWidget {
  const IconoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, top: 10.0),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.lightBlueAccent),
      child: IconButton(
        onPressed: () {
          showSearch(context: context, delegate: SearchJuegosDelegate());
        },
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}

// search_delegate.dart

class SearchJuegosDelegate extends SearchDelegate {
  final DeporteData deporteData = DeporteData();
  final CarreraData carreraData = CarreraData();
  final EstrategiaData estrategiaData = EstrategiaData();
  final ActionData actionData = ActionData();
  final PeleaData peleaData = PeleaData();
  final NoticiaData noticiaData = NoticiaData();
  final TerrorData terrorData = TerrorData();
  final TopData topData = TopData();
  @override
  String get searchFieldLabel => "Buscar juegos";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear_rounded),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResultList(context);
  }

//widget privado
  Widget _buildResultList(BuildContext context) {
    final List<Map<dynamic, dynamic>> results = (deporteData.listaDeportes +
            carreraData.listaCarrera +
            estrategiaData.listaEstrategia +
            actionData.listaAction +
            peleaData.listaPelea +
            noticiaData.listaNoticia +
            terrorData.listaTerror +
            topData.listaTop)
        .where((item) => item["titulo"]
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, index) {
        Map<dynamic, dynamic> result = results[index];
        return ListTile(
          title: Text(result["titulo"] ?? ""),
          onTap: () {
            //deportes
            if (deporteData.listaDeportes.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoDeporte(imageData: result),
                ),
              );
              //Carreras
              
            }
            if (carreraData.listaCarrera.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoCarrera(imageData: result),
                ),
              );
            }

            //Estrategia
            if (estrategiaData.listaEstrategia.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoEstrategia(imageData: result),
                ),
              );
            }
            //Action
            //Estrategia
            if (actionData.listaAction.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoAction(imageData: result),
                ),
              );
            }
            //Pelea
            if (peleaData.listaPelea.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPelea(imageData: result),
                ),
              );
            }
            //Noticia
            if (noticiaData.listaNoticia.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoNoticia(imageData: result),
                ),
              );
            }
            //Terror
            if (terrorData.listaTerror.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoTerror(imageData: result),
                ),
              );
            }
            //Top10
            if (topData.listaTop.contains(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoTop(imageData: result),
                ),
              );
            }
          },
        );
      },
    );
  }
}
