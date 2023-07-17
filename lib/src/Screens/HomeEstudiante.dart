//need widget return scaffold
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Widgets/Cards.dart';
import '../Widgets/GridNavigation.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/header.dart';

class HomeEstudianteScreen extends StatelessWidget {
  const HomeEstudianteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Layout(
          children: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              //Header main screen
              Header(),
              //Container for grid and weather
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //options grid
                  GridNavigation(childrens: [
                    OptionBox(
                        title: 'opcion 1',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                    OptionBox(
                        title: 'random',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                    OptionBox(
                        title: ' 2',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                    OptionBox(
                        title: 'opcion',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                  ]),
                  //wheather and time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CardTime(), CardTime()],
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
