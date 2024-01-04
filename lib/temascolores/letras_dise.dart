import 'package:flutter/material.dart';

Widget buildSectionHeader(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.left,
      ),
    ),
  );
}

Widget buildSection(String title, Widget widget, Widget linea) {
  return Column(
    children: [buildSectionHeader(title), widget, linea],
  );
}
