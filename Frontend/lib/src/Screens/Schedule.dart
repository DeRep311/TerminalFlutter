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
            child: Layout(
                children: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
          //Header main screen

          Header(nameOption: 'Visitante'),

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
                              materia: "HOlaaa",
                              horario: "12:35-1:20",
                              salon: "104",
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
                              materia: "HOlaaa",
                              horario: "12:35-1:20",
                              salon: "104",
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
                    return Items(
                      titulo: _items[index]["Nombre"],
                      Imagen: _items[index]["Imagen"],
                    );
                  },
                ),
              ),
            ],
          )
        ]))));
  }
}
