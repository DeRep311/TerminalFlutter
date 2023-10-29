// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
import 'package:my_app/src/Widgets/LeftCards/UbicationsPanel.dart';
import 'package:provider/provider.dart';

import '../Providers/Provider_Ubications.dart';
import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';
import '../Widgets/PanelEditor.dart';

class OperadorUbicaciones extends StatelessWidget {
  const OperadorUbicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    Provider_Ubications ubicationsProvider =
        Provider.of<Provider_Ubications>(context);
    return Scaffold(
        body: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Layout(
                children: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  //Header main screen

                  Header(nameOption: 'Visitante'),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BackButton(
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                        ),
                    
                        Column(
                          children: [
                                PanelEditor(),
                          
                            SizedBox(
                              width: 900,
                              height: 90,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 130,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    child: Text(
                                      "Viajar",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Poppins-Regular",
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Image(
                                            image: AssetImage(
                                                "lib/src/Assets/Icons/IconZoom.png")),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            color: Colors.white),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Image(
                                            image: AssetImage(
                                                "lib/src/Assets/Icons/IconZoom.png")),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: UbicationPanel(),
                        ),
                      ])
                ]))));
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
