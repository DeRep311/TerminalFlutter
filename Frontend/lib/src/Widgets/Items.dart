import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String titulo;
  final String Imagen;

  const Items({super.key, required this.titulo, required this.Imagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      width: 345,
      height: 46,
      decoration: BoxDecoration(
          color: Color.fromRGBO(184, 163, 118, 1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image(image: AssetImage(Imagen)), Text(titulo)],
      ),
    );
  }
}
