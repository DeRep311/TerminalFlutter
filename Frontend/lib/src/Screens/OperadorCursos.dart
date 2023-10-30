// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../Widgets/Header/header.dart';
import '../Widgets/Layout.dart';

class OperadorCursos extends StatelessWidget {
  const OperadorCursos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Layout(
         children: 
                  Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Header(nameOption: "Operador"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BackButton(
                            
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                            style: ButtonStyle(                              
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                          DataTable(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                              
                              ],
                            ),
                            columns: ["Tipo", "Grupo","Options"].map((e) => DataColumn(label: Text(e))).toList(), 
                            rows: _getDataRow()),

                           
                                SizedBox(
                                  height: 500,
                                  width: 250,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      color: Color.fromARGB(255, 61, 61, 61),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(0.0, 4.0),
                                          blurRadius: 4.0,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                          
                            


                            

                          
                        ],
                      )
                    ],


                  )

    ),
      ),
    );
  }
}


List<DataRow> _getDataRow() {
 List <DataRow> rows = [];
  rows.add(DataRow(cells: [
    DataCell(Text("EMT")),
    DataCell(Text("Grupo 1")),
    DataCell(Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
      ],
    ))
  ]));

  return rows;
  
}