// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final String imagePath;
  final String title;
  
  const OptionBox({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/login') ,
      child: Container(
      
        margin: EdgeInsets.fromLTRB(30, 50, 40, 0),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(52, 52, 52, 1),
        boxShadow: [
          BoxShadow(
            
            color: Color.fromRGBO(255, 255, 255, 0.25),
            offset: Offset(0.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 13,
            
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imagePath)),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 40,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    )
    );
  }
}
