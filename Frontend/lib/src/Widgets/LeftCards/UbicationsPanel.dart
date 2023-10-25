// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class UbicationPanel extends StatefulWidget {
  const UbicationPanel({super.key});

  @override
  State<UbicationPanel> createState() => _UbicationPanelState();
}

class _UbicationPanelState extends State<UbicationPanel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFF3D3D3D),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 500,
        width: 250,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(24.0),
    color: Color.fromARGB(255, 255, 255, 255),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(64, 255, 255, 255),
        offset: Offset(0.0, 4.0),
        blurRadius: 4.0,
        spreadRadius: 0,
      ),
    ],
  ),
  child: TextFormField(
    decoration: InputDecoration(
      labelText: 'Nombre',
      labelStyle: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'Inter',
        fontSize: 0,
        fontWeight: FontWeight.w200,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Ajusta el padding
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent, // Color del borde cuando no está enfocado
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent, // Color del borde cuando está enfocado
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
    
  ),
),
            //en los children 1 field 2 dropdown y dos logos en row, y un pequeño panel en blanco redondeado
    
            
             
          
          ],
        ),
      ),
    );
  }
}
