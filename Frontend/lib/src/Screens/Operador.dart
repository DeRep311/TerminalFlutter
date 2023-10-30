// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/LeftCards/CalendarOperador.dart';
import 'package:my_app/src/Widgets/LeftCards/CardsOperador.dart';

import '../Widgets/LeftCards/Cards.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/Header/Header.dart';

class OperadorScreen extends StatelessWidget {
  const OperadorScreen({super.key});

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //options grid
                  SizedBox(
                      height: 566,
                      width: 560,
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
                            title: 'Administracion\ncursos',
                            imagePath: 'lib/src/Assets/Icons/AdminCursos.png',
                            route: '/operador/cursos',
                          ),
                          OptionBox(
                            title: 'Administrar\nsuarios',
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
