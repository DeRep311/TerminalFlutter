// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/src/Providers/Provider_Ubications.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Items/FieldRounded.dart';
import 'package:provider/provider.dart';

class UbicationPanel extends StatefulWidget {
  const UbicationPanel({super.key});

  @override
  State<UbicationPanel> createState() => _UbicationPanelState();
}

class _UbicationPanelState extends State<UbicationPanel> {
  @override
  Widget build(BuildContext context) {
    Provider_Ubications ubicationsProvider =
        Provider.of<Provider_Ubications>(context);
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
                print(ubicationsProvider.isDeleting);
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
                print(ubicationsProvider.points);
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
                  color: ubicationsProvider.isDeleting
                      ? Color.fromARGB(139, 255, 255, 255)
                      : Color.fromARGB(255, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () => ubicationsProvider.isDeletingChange(),
                  icon: ImageIcon(
                    AssetImage("lib/src/Assets/Icons/Borrar.png"),
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: ubicationsProvider.isDrawing
                        ? Color.fromARGB(139, 255, 255, 255)
                        : Color.fromARGB(255, 255, 255, 255)),
                child: IconButton(
                  onPressed: () => ubicationsProvider.isDrawingChange(),
                  icon: ImageIcon(
                    AssetImage("lib/src/Assets/Icons/Editar.png"),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          //Escribir el codigo para la edicion de puntos
          Container(
            height: 200,
            width: 240,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color.fromRGBO(255, 255, 255, 1)),
            
                    child: Item(ubicationsProvider.points),
                  
            )
        
        ]));
  }

  ListView Item(List<Offset> points) {
    List<Widget> data = [];

    for (var off in points) {
      data.add(Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 1.0,
            ),
          ),
          
         
        ),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                  child: Text('X ${off.dx}'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                  child: Text('Y ${off.dy}'),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () => print("hola"),
                    icon: ImageIcon(
                      AssetImage("lib/src/Assets/Icons/ListaUbicaciones.png"),
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
      
      );
    }

    return ListView(
      children: data,
    );
  }
}
