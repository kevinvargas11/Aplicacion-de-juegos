import 'package:appgames/datasource/top10_data.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:appgames/widget/encabezado/iconosearch.dart';

import 'package:flutter/material.dart';

class ScrollTop extends StatelessWidget {
  const ScrollTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopData topData = TopData();

    return SizedBox(
      height: 265,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topData.listaTop.length,
        itemBuilder: (BuildContext context, index) {
          Map<dynamic, dynamic> imageData = topData.listaTop[index];
          return ImagenTop(imageData: imageData);
        },
      ),
    );
  }
}

// Esta clase representa un widget que muestra una imagen con efectos de animación al interactuar con ella.
class ImagenTop extends StatefulWidget {
  // El mapa que contiene la información de la imagen.
  final Map<dynamic, dynamic> imageData;

  // Constructor que requiere el mapa de información de la imagen.
  const ImagenTop({Key? key, required this.imageData}) : super(key: key);

  // Método que crea el estado asociado a este widget.
  @override
  ImagenTopState createState() => ImagenTopState();
}

// Clase que representa el estado del widget ImagenTop.
class ImagenTopState extends State<ImagenTop> with TickerProviderStateMixin {
  // Controlador de animación para manejar las animaciones.
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Inicialización del controlador de animación en el estado inicial.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    // Liberación de recursos al eliminar el widget.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // Cuando se toca la imagen, inicia la animación hacia adelante.
        _controller.forward();
      },
      onTapUp: (_) {
        // Cuando se levanta el dedo, revierte la animación y navega a la pantalla de información.
        _controller.reverse();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoTop(imageData: widget.imageData),
          ),
        );
      },
      onTapCancel: () {
        // Cuando la interacción se cancela, revierte la animación.
        _controller.reverse();
      },
      child: Container(
        height: 265,
        width: 150,
        margin: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(-10, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Imagen principal que se carga desde una URL.
              Image.network(
                widget.imageData["imagen"] ?? "",
                height: 265,
                width: 150,
                fit: BoxFit.cover,
              ),
              // Fondo blanco semi-transparente solo al tocar la imagen.
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            Colors.white.withOpacity(_controller.value * 0.3),
                      ),
                    );
                  },
                ),
              ),
              // Texto en la parte inferior.
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(11.0),
                    color: Colors.black.withOpacity(0.4),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.imageData["titulo"] ?? "",
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTop extends StatelessWidget {
  final Map<dynamic, dynamic> imageData;

  const InfoTop({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? trailerUrl = imageData["trailer"];
    final String videoId = YoutubePlayer.convertUrlToId(trailerUrl ?? '') ?? '';

    // Crea un controlador para el reproductor de YouTube
    YoutubePlayerController youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
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
                0.7
              ], // Ajusta la posición de los colores según tus preferencias
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const IconoSearch()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 9,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageData["imagen"] ?? "",
                      height: 300,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  imageData["titulo"] ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  imageData["descripcion"] ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Trailer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: youtubeController, // Usa el controlador creado
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),

                      RemainingDuration(), // Agrega RemainingDuration para mostrar el tiempo restante
                    ],
                    showVideoProgressIndicator: true,
                    onReady: () {
                      // Ejecuta acciones cuando el video está listo.
                    },
                    onEnded: (YoutubeMetaData metaData) {
                      // Al finalizar el video, establece la posición al inicio y pausa el video.
                      youtubeController.seekTo(const Duration(seconds: 0));
                      youtubeController.pause();
                    },
                  ),
                  builder: (context, player) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: player,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30), // Espacio adicional

              // Texto de descarga
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Descargar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Botones en el medio y horizontalmente
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Lógica cuando se presiona el primer botón
                    },
                    icon: const Icon(Icons.download),
                    label: const Text("Descargar"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Lógica cuando se presiona el segundo botón
                    },
                    icon: const Icon(Icons.download),
                    label: const Text("Descargar"),
                  ),
                ],
              ),
              const SizedBox(height: 72),
            ],
          ),
        ),
      ),
    );
  }
}
