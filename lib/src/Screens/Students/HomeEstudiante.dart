// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../Widgets/Cards.dart';

import '../../Widgets/Layout.dart';
import '../../Widgets/OptionBox.dart';
import '../../Widgets/Header.dart';

class HomeEstudiante extends StatelessWidget {
  const HomeEstudiante({super.key});

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

              Header(nameOption: 'Logued',),
              //Container for grid and weather
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 550,
                    height: 502,
                    child: Column(
                     mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [ 
                      
                       Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                        children: [
                          Expanded(child: OptionBox(
                        title: 'Salon',
                        imagePath:
                            'lib/src/Assets/Icons/SalonIcon.png',
                              route: '/',
                              ),),
                   
                     Expanded(child: OptionBox(
                        title: 'Horarios',
                        imagePath:
                            'lib/src/Assets/Icons/RelojIcon.png',
                            route: '/',    
                            
                            
                            
                            ),),
                 
                    
                  ]),
                   Expanded(
                   
                    
                    child: 
                   
                   
                   OptionBox(
                        title: 'Ubicaciones',
                        imagePath:
                            'lib/src/Assets/Icons/graduation-hat-02.png',
                              route: '/',
                              )) ,
                            
                            
                            
                            ],
                  
                  
                  ),
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