// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:my_app/src/Widgets/LeftCards/Calendar.dart';
import 'package:my_app/src/Widgets/LeftCards/CalendarOperador.dart';

import '../Widgets/LeftCards/Cards.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/Header/Header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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

              Header(
                nameOption: 'Visitante',
              ),
              //Container for grid and weather
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 255, 255, 255), // background color
                      onPrimary: Colors.black, // text color
                    ),
                    onPressed: () {
                      //mejorar la funcion de logout
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Salir'),
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //options grid

                  SizedBox(
                      height: 506,
                      width: 550,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: OptionBox(
                                title: 'Horarios',
                                imagePath: 'lib/src/Assets/Icons/RelojIcon.png',
                                route: '/horarios',
                              ),
                            ),
                            Expanded(
                              child: OptionBox(
                                title: 'Ubicaciones',
                                imagePath:
                                    'lib/src/Assets/Icons/LocationsIcon.png',
                                route: '/locations',
                              ),
                            )
                          ])),

                  //wheather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTime(
                        children: Calendar(),
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
