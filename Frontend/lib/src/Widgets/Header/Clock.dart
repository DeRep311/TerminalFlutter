// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
 
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {


      Future.delayed(Duration(seconds: 1)).then((_) { 
      if (mounted) setState(() {});
    });


    return SizedBox(
      height: 80,
      width: 190,
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Text(
            ' ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 50,
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          CustomPaint(
            size: Size(0, 50),
            painter: LineClock(),
          ),
          Text(
         DateTime.now().hour > 12 ? 'PM' : 'AM',
          
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 25,
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LineClock extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.square;

    Offset startingPoint = Offset(0, 0);
    Offset endingPoint = Offset(0, size.height);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
