// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Widgets/Cards.dart';
import '../Widgets/GridNavigation.dart';
import '../Widgets/Layout.dart';
import '../Widgets/OptionBox.dart';
import '../Widgets/Header.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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

              Header( nameOption: 'StudentLoged',),
              //Container for grid and weather
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  GridNavigation(childrens: [
                    OptionBox(
                        title: 'Salon',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                    
                    OptionBox(
                        title: 'Horarios',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                    
                  ]),],
                  ),
             
                
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