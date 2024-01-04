import 'package:appgames/widget/encabezado/iconosearch.dart';
import 'package:flutter/material.dart';

class AppBarApp {
  AppBar getAppBarApp() => AppBar(
        elevation: 5,
        backgroundColor: Colors.transparent,
        leading: Padding(
          //tamaño de la imgaen y padding sirve para que este a la izquierda
          padding: const EdgeInsets.all(1.0),
          child: Image.network(
              "https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png"),
        ),
        title: const Text("Games"),
        actions: const [
          IconoSearch()
//Agregar un buton search
        ],
      );
}
