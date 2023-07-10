// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget children;

  const Layout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(26.0, 0.0, 0.0, 0.0),
        child: Container(
          height: (MediaQuery.of(context).size.height * 1),
          width: (MediaQuery.of(context).size.width * 1),
          decoration: BoxDecoration(
              color: Color.fromRGBO(52, 52, 52, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(230.0, 221.0),
                topRight: Radius.circular(0.0),
              )),
        child: children
        
        )
        );
  }
}
