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
       color: Color.fromRGBO(52, 52, 52, 1),
       boxShadow: [
          BoxShadow(
            
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 13,
            
          )],
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
