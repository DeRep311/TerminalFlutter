// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/LeftCards/CalendarOperador.dart';
import 'package:my_app/src/Widgets/LeftCards/CardsOperador.dart';

import '../Widgets/LeftCards/Cards.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/Header/Header.dart';

class OpcionesOperadorScreen extends StatelessWidget {
  const OpcionesOperadorScreen({super.key});

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

              Header(nameOption: 'Operador'),
              //Container for grid and weather
              SizedBox(
                child: Align(
                  //ARREGLAR PROBLEMA DEL ESPACIO
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BackButton(
                      color: Colors.white,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //options grid
                  SizedBox(
                      height: 530,
                      width: 530,
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          OptionBox(
                            title: 'Administrar\nhorarios',
                            imagePath: 'lib/src/Assets/Icons/RelojIcon.png',
                            route: '/operador/horarios',
                          ),
                          OptionBox(
                            title: 'Administrar\nubicaciones',
                            imagePath:
                                'lib/src/Assets/Icons/AdministrarUbicaciones.png',
                            route: '/operador/ubicaciones',
                          ),
                          OptionBox(
                            title: 'Administrar\ncursos',
                            imagePath: 'lib/src/Assets/Icons/AdminCursos.png',
                            route: '/operador/cursos',
                          ),
                          OptionBox(
                            title: 'Administrar\nusuarios',
                            imagePath:
                                'lib/src/Assets/Icons/AdministrarUsuarios.png',
                            route: '/operador/usuarios',
                          )
                        ],
                      )),

                  //wheather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTimeOperador(
                        children: CalendarOperador(),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
