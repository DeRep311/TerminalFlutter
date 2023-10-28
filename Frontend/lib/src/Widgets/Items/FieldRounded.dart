// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FieldRounded extends StatelessWidget {
  final String label;
  final funtion;

  const FieldRounded({Key? key, required this.label, required this.funtion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: Color.fromARGB(255, 255, 255, 255)),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          //centralo
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          labelText: label,
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'Inter',
            fontSize: 23,
            fontWeight: FontWeight.w200,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.transparent, // Color del borde cuando no está enfocado
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
        validator: funtion,
      ),
    );
  }
}
