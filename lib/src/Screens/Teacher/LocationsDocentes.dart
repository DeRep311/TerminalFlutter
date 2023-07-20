// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Widgets/LeftCards/Calendar.dart';
import '../../Widgets/LeftCards/Cards.dart';
import '../../Widgets/Layout.dart';
import '../../Widgets/OptionBox.dart';
import '../../Widgets/Header/Header.dart';

class LocationsDocentes extends StatelessWidget {
  const LocationsDocentes({super.key});

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

              const Header(
                nameOption: 'Logued',
              ),

              // Flecha para volver atrás
              Row(
                children: [
                  SizedBox(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 32, // Ajusta el tamaño del ícono aquí
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 650,
                    height: 506,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OptionBox(
                                title: 'Baño',
                                imagePath: 'lib/src/Assets/Icons/BanioIcon.png',
                                route: '/',
                              ),
                            ),
                            Expanded(
                              child: OptionBox(
                                title: 'Adscripción',
                                imagePath: 'lib/src/Assets/Icons/AdscripIcon.png',
                                route: '/',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OptionBox(
                                title: 'Cantina',
                                imagePath: 'lib/src/Assets/Icons/CantinaIcon.png',
                                route: '/',
                              ),
                            ),
                            Expanded(
                              child: OptionBox(
                                title: 'Bedelía',
                                imagePath: 'lib/src/Assets/Icons/AdminIcon.png',
                                route: '/',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //weather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTime(
                        children: Calendar(), // Asegúrate de que CardTime acepte solo un hijo
                      ),
                      CardTime(
                        children: Text(
                          '12:00',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 96,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
