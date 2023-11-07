import 'package:flutter/material.dart';

import '../Models/UbicacionDTO.dart';

class UbicationPanelView extends StatefulWidget {
  final UbicationDTO ubicacion;

  UbicationPanelView({required this.ubicacion});

  @override
  _UbicationPanelViewState createState() => _UbicationPanelViewState();
}

class _UbicationPanelViewState extends State<UbicationPanelView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Stack(
          children: [
            Image.asset(
              widget.ubicacion.planoImg,
              fit: BoxFit.cover,
            ),
            CustomPaint(
              painter: LinePainter(
                startColor: Colors.green,
                endColor: Colors.red,
                points: widget.ubicacion.idCs
                    .map((e) => Offset(e.cooX ?? 0, e.cooY ?? 0))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> points;
  final Color startColor;
  final Color endColor;
  final double lineWidth;

  LinePainter({
    required this.points,
    this.startColor = const Color.fromARGB(255, 255, 1, 1),
    this.endColor = const Color.fromARGB(255, 1, 255, 7),
    this.lineWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    if (points.length < 2) {
      return; // No se pueden dibujar líneas con menos de dos puntos.
    }

    for (int i = 0; i < points.length - 1; i++) {
      paint.color = i == 0 ? startColor : endColor;
      canvas.drawLine(points[i], points[i + 1], paint);
    }

    // Draw start and end points with different colors
    paint.color = startColor;
    canvas.drawCircle(points[0], 10.0, paint);

    paint.color = endColor;
    canvas.drawCircle(points[points.length - 1], 10.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
