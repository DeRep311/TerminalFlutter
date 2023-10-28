// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Items/FieldRounded.dart';

class UbicationPanel extends StatefulWidget {
  const UbicationPanel({super.key});

  @override
  State<UbicationPanel> createState() => _UbicationPanelState();
}

class _UbicationPanelState extends State<UbicationPanel> {
  @override
  Widget build(BuildContext context) {
    List<String> dropdownValue = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
    String? selectedOption;
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFF3D3D3D),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 500,
        width: 250,
        alignment: Alignment.topCenter,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          FieldRounded(
            label: "Nombre",
            funtion: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un nombre';
              }
              return null;
            },
          ),
         
          DropDownSelect(
            label: "Plano Dependiente",
            options: dropdownValue,
            selectedValue: selectedOption,
            OnChanged: (value) {
              setState(() {
                selectedOption = value;
                print(selectedOption);
              });
            },
          ),
           DropDownSelect(
            label: "Plano Dependiente",
            options: dropdownValue,
            selectedValue: selectedOption,
            OnChanged: (value) {
              setState(() {
                selectedOption = value;
                print(selectedOption);
              });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                margin: EdgeInsets.only(right: 20, top: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color.fromARGB(255, 255, 255, 255),
             
            ),
            ),
             Container(
              margin: EdgeInsets.only(right: 20, top: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color.fromARGB(255, 255, 255, 255),
             
            ),
            ),

            ],
          ),
          //Escribir el codigo para la edicion de puntos

         
          
        ]));
  }
}
