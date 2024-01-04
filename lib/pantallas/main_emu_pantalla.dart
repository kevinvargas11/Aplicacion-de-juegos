import 'package:appgames/widget/encabezado/appbarwidget.dart';
import 'package:flutter/material.dart';

class MainEmuPantalla extends StatelessWidget {
  const MainEmuPantalla({super.key});

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
