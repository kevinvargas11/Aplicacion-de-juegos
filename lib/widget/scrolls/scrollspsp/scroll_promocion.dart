import 'package:appgames/datasource/noticia_data.dart';
import 'package:appgames/widget/encabezado/appbarwidget.dart';
import 'package:flutter/material.dart';

class ScrollNoticia extends StatelessWidget {
  const ScrollNoticia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticiaData noticiaData = NoticiaData();

    return SizedBox(
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: noticiaData.listaNoticia.length,
        itemBuilder: (BuildContext context, index) {
          Map<dynamic, dynamic> imageData = noticiaData.listaNoticia[index];
          return ImagenNoticia(imageData: imageData);
        },
      ),
    );
  }
}

class ImagenNoticia extends StatelessWidget {
  final Map<dynamic, dynamic> imageData;

  const ImagenNoticia({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Image.network(
            imageData["imagen"] ?? "",
            height: 500,
            width: 500,
          ),
          const SizedBox(height: 8.0),
          Text(imageData["titulo"] ?? ""),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoNoticia(imageData: imageData),
                ),
              );
            },
            child: const Text("Boton prueba"),
          )
        ],
      ),
    );
  }
}

class InfoNoticia extends StatelessWidget {
  final Map<dynamic, dynamic> imageData;

  const InfoNoticia({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarApp().getAppBarApp(),
      body: Column(
        children: [
          Image.network(
            imageData["imagen"] ?? "",
            height: 400,
            width: 400,
          ),
          const SizedBox(height: 8.0),
          Text(imageData["titulo"] ?? ""),
          Text(imageData["descripcion"] ?? ""),
        ],
      ),
    );
  }
}
