// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10), // Margen del botón
      // padding: EdgeInsets.all(8), // Relleno interno del botón
      width: 80, // Ancho del botón
      height: 40, // Alto del botón
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 17),
           // Tamaño de la fuente
        ),
      ),
    );
  }
}