// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Models/Coordenadas.dart';
import 'package:my_app/src/Models/UbicacionDTO.dart';
import 'package:my_app/src/Screens/Panorama.dart';
import 'package:my_app/src/Widgets/Items.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';
import '../Widgets/Panel.dart';

class Ubications extends StatefulWidget {
  const Ubications({super.key});

  @override
  State<Ubications> createState() => _UbicationsState();

  
}

class _UbicationsState extends State<Ubications> {
  bool ubiselect = false;
  int _count = 0;
   late List<String> imagenes;

  List<UbicationDTO> ubicaciones = [
    UbicationDTO(
        codigoUbicaciones: "baño",
        nombre: "Casa",
        publico: false,
        privado: true,
        codigoP: "Facultad",
        planoImg: "lib/src/Assets/Icons/PlanoFacultad.jpg",
        idCs: [
          Coordenada(
            idC: 1,
            cooX: 185,
            cooY: 397,
            inicio: false,
            Cfinal: false,
            image: 'lib/src/Assets/panorama.jpg',
          ),
          Coordenada(
            idC: 2,
            cooX: 512,
            cooY: 389,
            inicio: true,
            Cfinal: false,
            image: 'lib/src/Assets/panorama.jpg',
          ),
          Coordenada(
            idC: 3,
            cooX: 583,
            cooY: 384,
            inicio: false,
            Cfinal: true,
            image: 'lib/src/Assets/panorama.jpg',
          ),
        ]),
    UbicationDTO(
        codigoUbicaciones: "escaleras",
        nombre: "Casa",
        publico: false,
        privado: true,
        codigoP: "Facultad",
        planoImg: "lib/src/Assets/Icons/PlanoFacultad.jpg",
        idCs: [
          Coordenada(
            idC: 1,
            cooX: 567,
            cooY: 72,
            inicio: true,
            Cfinal: false,
            image: 'lib/src/Assets/panorama.jpg',
          ),
          Coordenada(
            idC: 2,
            cooX: 364,
            cooY: 391,
            inicio: false,
            Cfinal: false,
            image: 'lib/src/Assets/panorama.jpg',
          ),
          Coordenada(
            idC: 3,
            cooX: 165,
            cooY: 151,
            inicio: false,
            Cfinal: true,
            image: 'lib/src/Assets/panorama.jpg',
          ),
        ])
  ];
  

  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                   
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 900,
                              height: 500,
                              child: Stack(
                                
                                children: [
                                  ubiselect
                                      ? 
                                      UbicationPanelView(
                                          ubicacion: ubicaciones[_count])
                                      : Container(
                                          margin: EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                "Seleccione una ubicacion"),
                                          ),
                                        ),
                                ],
                              ),
                            ),
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
                                    child: TextButton(
                                      onPressed: () => {
                                        // imagenes = ubicaciones[_count].idCs.map((e) => e.imagen).toList(),
                                        if (ubiselect){


                                             Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PanoramaViewer( imageUrls: ubicaciones[_count].idCs.map((e) => e.image).toList(),)))
                                        }
                                       
                                      },
                                     
                                      
                                      child: Text(
                                      "Viajar",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Poppins-Regular",
)                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromRGBO(61, 61, 61, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 4.0,
                                  spreadRadius: 0,
                                ),
                              ]),
                          height: 500,
                          width: 250,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: this.ubicaciones.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              String nombre =
                                  ubicaciones[index].codigoUbicaciones;

                              return TextButton(
                                onPressed: () => {
                                  
                                  setState(() {
                                    _count = index;
                                    ubiselect = true;
                                  })
                                },
                                child: Text(nombre,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Poppins-Regular",
                                    )),
                              );
                            },
                          ),
                        )
                      ])
                ]))));
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> points;
  final Color lineColor;
  final double lineWidth;

  LinePainter(
      {required this.points,
      this.lineColor = const Color.fromARGB(255, 255, 1, 1),
      this.lineWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    if (points.length < 2) {
      return; // No se pueden dibujar líneas con menos de dos puntos.
    }

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Puedes ajustar esto según tus necesidades de repintado
  }
}
