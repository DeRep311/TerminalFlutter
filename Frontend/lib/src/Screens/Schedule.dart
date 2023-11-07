// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items.dart';
import 'package:my_app/src/Widgets/LeftCards/HorarioCards.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        "Nombre": "Sociologia",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Lunes",
        "Hora": "10:00",
        "Salon": "105"
      },
      {
        "Nombre": "Matematicas",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Lunes",
        "Hora": "10:00",
        "Salon": "107"
      },
      {
        "Nombre": "Filosofia",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Lunes",
        "Hora": "10:00",
        "Salon": "208"
      },
      {
        "Nombre": "Programacion",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Jueves",
        "Hora": "9:15",
        "Salon": "Lab 2"
      },
      {
        "Nombre": "sociologia",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Lunes",
        "Hora": "10:00",
        "Salon": "101"
      },
      {
        "Nombre": "sociologia",
        "Imagen": "lib/src/Assets/Icons/GorroGraduacion.png",
        "Dia": "Lunes",
        "Hora": "10:00",
        "Salon": "101"
      },
    ];

    return Scaffold(
        body: Container(
            child: Layout(
                children: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
          //Header main screen

          Header(nameOption: 'Visitante'),
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 319,
                  height: 312,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35.0)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HorarioCard(
                              title: "Ahora mismo",
                              materia: "Filosofia",
                              horario: "9:15-11:05",
                              salon: "104",
                              dia: "Lunes",
                              imagePathMateria:
                                  'lib/src/Assets/Icons/MateriaIcon.png',
                              imagePathHorario:
                                  'lib/src/Assets/Icons/MiniClock.png',
                              imagePathSalon:
                                  'lib/src/Assets/Icons/ClaseIcon.png',
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Container(
                  width: 319,
                  height: 312,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35.0)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HorarioCard(
                              title: "Proximo",
                              materia: "Ingles",
                              horario: "11:05-12:35",
                              salon: "104",
                              dia: "Lunes",
                              imagePathMateria:
                                  'lib/src/Assets/Icons/MateriaIcon.png',
                              imagePathHorario:
                                  'lib/src/Assets/Icons/MiniClock.png',
                              imagePathSalon:
                                  'lib/src/Assets/Icons/ClaseIcon.png',
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
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
                      final item = _items[index];

                      return ExpansionTile(
                        backgroundColor: Color.fromRGBO(184, 163, 118, 1),
                        collapsedBackgroundColor: Color.fromRGBO(184, 163, 118, 1),
                        expandedCrossAxisAlignment: CrossAxisAlignment.center,
                        
                        title: Items(
                          titulo: item["Nombre"],

                          Imagen: item["Imagen"],
                        ),
                        children: [
                          Container(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  "Dia: ${item["Dia"]}\nHora: ${item["Hora"]}\nSalon: ${item["Salon"]}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                  )),
            ],
          )
        ]))));
  }
}
