import 'package:appgames/datasource/noticia_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HorizontalNoticias extends StatelessWidget {
  const HorizontalNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoticiaData noticiaData =
        NoticiaData(); // Crear una instancia de NoticiaData
    final List<Map<dynamic, dynamic>> listaNoticia =
        noticiaData.listaNoticia; // Obtener la lista de noticias

    final List<Widget> imageSliders = listaNoticia.map((item) {
      // Crear un Widget para cada imagen
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Center(
          child: Image.network(
            item["imagen"] ?? "",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      );
    }).toList();

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
