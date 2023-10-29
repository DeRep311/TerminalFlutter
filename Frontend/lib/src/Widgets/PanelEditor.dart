import 'package:flutter/material.dart';
import 'package:my_app/src/Providers/Provider_Ubications.dart';
import 'package:provider/provider.dart';

class PanelEditor extends StatefulWidget {
  const PanelEditor({super.key});

  @override
  State<PanelEditor> createState() => _PanelEditorState();
}

class _PanelEditorState extends State<PanelEditor> {
  @override
  Widget build(BuildContext context) {
    Provider_Ubications ubicationsProvider =
        Provider.of<Provider_Ubications>(context);
    return GestureDetector(
      onTapDown: (value) {
        if (ubicationsProvider.isDrawing) {
          ubicationsProvider.addPoint(value.localPosition);
        }
        if (ubicationsProvider.isDeleting) {
          print("Aqui");
          for (var colecction in ubicationsProvider.points) {
            double dx = colecction.dx - value.localPosition.dx;
            double dy = colecction.dy - value.localPosition.dy;
            double distance = (dx * dx) + (dy * dy);
            print(distance);
            if (distance < 300) {
              ubicationsProvider.deletePoint(colecction);
               break;
            }
           
          }
        }
        setState(() {});
      },
      child: Stack(
        children: [
          ubicationsProvider.image == null
              ? SizedBox(
                
                
                  width: 900,
                  height: 500,
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Center(
                    child: Text("Seleccione un plano"),
                  ),
                )
                )
              
              : Image.network(ubicationsProvider.image!,
              scale: ubicationsProvider.zoom,
               fit: BoxFit.cover,
                width: 900,
                height: 500,
                
             
              )
          ,CustomPaint(
            painter: RedPointsPainter(ubicationsProvider.points),
          ),
        ],
      ),
    );
 
   

  }
}

class RedPointsPainter extends CustomPainter {
  final List<Offset> redPoints;

  RedPointsPainter(this.redPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
      

    for (Offset point in redPoints) {
      canvas.drawCircle(point, 5.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
