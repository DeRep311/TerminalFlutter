// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

class OperadorUsuariosScreen extends StatelessWidget {
  const OperadorUsuariosScreen({super.key});

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

                  Header(nameOption: 'Visitante'),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BackButton(
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 790,
                              height: 41,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254)),
                              ),
                            ),
                            SizedBox(
                              width: 790,
                              height: 362,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254)),
                              ),
                            ),
                          ],
                        ),
                        SearchFilterUsuarios(),
                      ])
                ]))));
    ;
  }
}

Widget _buildTable(List<dynamic> list, List<String> columns) {
  return DataTable(columns: <DataColumn>[
    for (var c in columns) DataColumn(label: Text(c))

  ], rows: <DataRow>[
    for (var item in list)
      DataRow(cells: <DataCell>[
        for (var c in columns) DataCell(Text(item[c]))
      ])
    
   
  ]);
}
