

import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String text;


  const Box({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), // Margen del contenedor
      // padding: EdgeInsets.all(8), // Relleno interno del contenedor
      width: 80, // Ancho del contenedor
      height: 40, // Alto del contenedor
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25, // Tamaño de la fuente
          ),
        ),
      ),
    );
  }
}
