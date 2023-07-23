// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../Widgets/LeftCards/Calendar.dart';
import '../../Widgets/LeftCards/Cards.dart';

import '../../Widgets/Layout.dart';
import '../../Widgets/OptionBox.dart';
import '../../Widgets/Header/Header.dart';
import '../../Widgets/Button.dart';




class HomeDocentes extends StatelessWidget {
  const HomeDocentes({super.key});

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
              


              //----------------------Flecha para retroceder--------------------
              // Row(
              //   children: [
              //     SizedBox(
              //       child: IconButton(
              //         icon: Icon(
              //           Icons.arrow_back,
              //           size: 32, // Ajusta el tamaño del ícono aquí
              //           color: Colors.white,
              //         ),
              //         onPressed: () {
              //           // Lógica de navegación para retroceder a la screen anterior
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              //-----------------------------------------------------------------






              //----------------------Boton para salir--------------------------



                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                  children: [
                    SizedBox(
                      child: Button(
                        text: 'Salir',
                        onPressed: () {
                        Navigator.pushNamed(context, '/');
                        },
                      ),
                      
                    ),

                  ],

                ),




              //-----------------------------------------------------------------
              
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
                            'lib/src/Assets/Icons/SalonIcon.png',
                              route: '/Salones',
                              ),),
                   
                     Expanded(
                      child: OptionBox(
                        title: 'Horarios',
                        imagePath:
                            'lib/src/Assets/Icons/RelojIcon.png',
                            route: '/HorariosDocentes',    
                            
                            
                            
                            ),),
                 
                    
                  ]),
                   Expanded(
                   
                    
                    child: 
                   
                   
                   OptionBox(
                        title: 'Ubicaciones',
                        imagePath:
                            'lib/src/Assets/Icons/LocationsIcon.png',
                              route: '/LocationsDocentes',
                              )) ,
                            
                            
                            
                            ],
                  
                  
                  ),
                  
                  
                  
                  
                  ),
                  
                  
             
                
                  //wheather and time
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