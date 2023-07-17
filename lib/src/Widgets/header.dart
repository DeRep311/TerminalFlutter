// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  final String name;
  const Greeting({super.key, required this.name});


  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  //lo recibira del backend



  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi, ${widget.name} ',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      style: const TextStyle(
          color: Color.fromARGB(255, 201, 198, 198),
          fontSize: 64,
          fontFamily: 'Imprima',
          fontWeight: FontWeight.w500),
    );
  }
}

class Header extends StatelessWidget {
 
  const Header({super.key, required this.nameOption});
  final String nameOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 107,
          padding: const EdgeInsets.fromLTRB(0, 20, 50, 0),
          decoration:
              const BoxDecoration(color: Color.fromARGB(0, 167, 149, 149)),
          child:  Greeting( name:nameOption),
        
        ),
        CustomPaint(
            size: Size((MediaQuery.of(context).size.width * 1), 5),
            painter: LineWhite()),
      ],
    );
  }
}

class LineWhite extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.square;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
