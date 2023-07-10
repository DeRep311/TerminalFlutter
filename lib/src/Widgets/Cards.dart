// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last


import 'package:flutter/material.dart';

class CardTime extends StatelessWidget {
  const CardTime({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Container(
      margin: EdgeInsets.fromLTRB(100.0, 40.0, 0.0, 0.0),
      alignment: Alignment(0.0, -0.2),
      width: 430,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topLeft,
      stops: [0.0, 1.0],
      colors: [
        Color.fromRGBO(255, 255, 255, 0.40),
        Color.fromRGBO(255, 255, 255, 0.10),
      ],
      transform: GradientRotation(153 * (3.1415926 / 180)),
      
    ),
      
      ),
      child: Text(
        '12:00',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 96,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}
