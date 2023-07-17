
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
            children:  [
              //Header main screen

              Header( nameOption: 'Visitante'),
              //Container for grid and weather
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //options grid
                  SizedBox(
                    height: 503,
                    width: 550,
                    child:  Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

                   Expanded(child: OptionBox(
                        title: 'opcion 1',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                     ),
                     
                      Expanded(child: OptionBox(
                        title: 'opcion 1',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png'),
                     )
                     ])
                 
                   

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
