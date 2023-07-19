// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../Widgets/LeftCards/Cards.dart';

import '../../Widgets/Layout.dart';
import '../../Widgets/OptionBox.dart';
import '../../Widgets/Header/Header.dart';

class TeacherOptions extends StatelessWidget {
  const TeacherOptions({super.key});

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
                nameOption: 'Logued',
              ),
              //Container for grid and weather
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
                                  title: 'Salon',
                                  imagePath:
                                      'lib/src/Assets/Icons/graduation-hat-02.png',
                                  route: '/',
                                ),
                              ),
                              Expanded(
                                child: OptionBox(
                                  title: 'Salon',
                                  imagePath:
                                      'lib/src/Assets/Icons/graduation-hat-02.png',
                                  route: '/',
                                ),
                              ),
                            ]),
                        Expanded(
                            child: OptionBox(
                          title: 'Horarios',
                          imagePath:
                              'lib/src/Assets/Icons/graduation-hat-02.png',
                          route: '/',
                        )),
                      ],
                    ),
                  ),

                  //wheather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CardTime(
                       children: Text(
          '12:00',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 96,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
                    ), CardTime(
                       children: Text(
          '12:00',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 96,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
                    )],
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
