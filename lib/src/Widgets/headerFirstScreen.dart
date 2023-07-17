import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  //lo recibira del backend



  @override
  Widget build(BuildContext context) {
    return Text(
      "Hola, visitante",
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 64,
          fontFamily: 'Imprima',
          fontWeight: FontWeight.w500),
    );
  }
}

class HeaderFirstScreen extends StatelessWidget {
  const HeaderFirstScreen({super.key});

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
          child: const Greeting(),
        
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
