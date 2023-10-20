// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String route;

  const OptionBox(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 50, 40, 0),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(61, 61, 61, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 115,
                width: 110,
                child: Image(image: AssetImage(imagePath)),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
