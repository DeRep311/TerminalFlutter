// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/LeftCards/CalendarOperador.dart';

import '../Widgets/LeftCards/Cards.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/Header/Header.dart';

class OperadorUbicacionesMenu extends StatelessWidget {
  const OperadorUbicacionesMenu({super.key});

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
                            title: 'Lista de\nubicaciones',
                            imagePath:
                                'lib/src/Assets/Icons/ListaUbicaciones.png',
                            route: '/login',
                          ),
                          OptionBox(
                            title: 'Crear\nubicaciones',
                            imagePath:
                                'lib/src/Assets/Icons/AdministrarUbicaciones.png',
                            route: '/Locations',
                          ),
                          OptionBox(
                            title: 'Lista de\nplanos',
                            imagePath: 'lib/src/Assets/Icons/ListaPlanos.png',
                            route: '/Option3',
                          ),
                          OptionBox(
                            title: 'Subir planos',
                            imagePath: 'lib/src/Assets/Icons/SubirPlanos.png',
                            route: '/Option4',
                          )
                        ],
                      )),

                  //wheather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTime(
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
