import 'package:appgames/widget/encabezado/appbarwidget.dart';
import 'package:flutter/material.dart';

class MainPs2Pantalla extends StatelessWidget {
  const MainPs2Pantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarApp().getAppBarApp(),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
