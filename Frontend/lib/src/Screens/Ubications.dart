// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

class Ubications extends StatelessWidget {
  const Ubications({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      }
    ];

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
                            SizedBox(
                              width: 900,
                              height: 462,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                decoration: BoxDecoration(color: Colors.black),
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
                            itemCount: _items.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Items(
                                titulo: _items[index]["Nombre"],
                                Imagen: _items[index]["Imagen"],
                              );
                            },
                          ),
                        ),
                      ])
                ]))));
    ;
  }
}
