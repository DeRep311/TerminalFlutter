// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../Widgets/LeftCards/Cards.dart';
import '../../Widgets/Layout.dart';
import '../../Widgets/OptionBox.dart';
import '../../Widgets/Header/Header.dart';
import '../../Widgets/LeftCards/Calendar.dart';


class GuestLocation extends StatelessWidget {
  const GuestLocation({super.key});

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


            
              //------------------------Con este codigo se puede agrandar el size de la flecha y tambien ya tiene la logica para retroceder de screen-----------------------------------------
              Row(
                children: [
                  SizedBox(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32, // Ajusta el tamaño del ícono aquí
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Lógica de navegación para retroceder a la screen anterior
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              //-------------------------------------------------------------------------------------------------------------------------------------------------------------

              //------------------------Esto hace la flecha con la funcion para ir una screen atras ya funcionando-----------------------------------------
              // Row(

              //   children: [

              //     SizedBox(
              //       child: BackButton(
              //       color: Colors.white,
              //       style: ButtonStyle(

              //         backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              //         overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
              //       ),
              //     ),
              //     ),
              //   ],
              // ),
              //--------------------------------------------------------------------------------------------------------------------------------------------

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 550,
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
                                  title: 'Baños',
                                  imagePath:
                                      'lib/src/Assets/Icons/BanioIcon.png',
                                  route: '/',
                                ),
                              ),
                              Expanded(
                                child: OptionBox(
                                  title: 'Auditorio',
                                  imagePath:
                                      'lib/src/Assets/Icons/AuditorioRoomIcon.png',
                                  route: '/',
                                ),
                              ),
                            ]),
                        Expanded(
                          child: OptionBox(
                            title: 'Adscripciones',
                            imagePath:
                                'lib/src/Assets/Icons/AdscripIcon.png',
                            route: '/',
                          ),
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
