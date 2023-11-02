// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Button.dart';
import 'package:my_app/src/Widgets/Items/FieldRounded.dart';

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
            children: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
                Column(
                  children: [
                     Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 700,
                  height: 500,
                  child: DataTable(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      columns: ["Tipo", "Grupo", "Options"]
                          .map((e) => DataColumn(label: Text(e)))
                          .toList(),
                      rows: _getDataRow()),
                ),
                Row(
                  
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Agregar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 12,
                            fontFamily: "Poppins-Regular",
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Eliminar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 12,
                            fontFamily: "Poppins-Regular",
                          ),
                        ),
                      ),
                    ),
                     Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Actualizar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 12,
                            fontFamily: "Poppins-Regular",
                          ),
                        ),
                      ),
                    ),
                 
                  ],
                )

                  ],
                ),
               
                SizedBox(
                  height: 500,
                  width: 300,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
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
                  
                    
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                             FieldRounded(label: "Filtrar Grupo", funtion:null),
                           FieldRounded(label: "Filtrar Curso", funtion:null),

                          ],
                        ),                                              
                        Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(24.0),

                            ),
                            child: TextButton(
                              onPressed: () => {},
                              child: Text("Administrar\nhorarios",style: TextStyle(
                                color: Color.fromARGB(255, 61, 61, 61),
                                fontSize: 12,
                                fontFamily: "Poppins-Regular",
                              ),
                              ),
                              ),
                              ),
                               Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(24.0),

                            ),
                            child: TextButton(
                              onPressed: () => {},
                              child: Text("Administrar\nCursos",style: TextStyle(
                                color: Color.fromARGB(255, 61, 61, 61),
                                fontSize: 12,
                                fontFamily: "Poppins-Regular",
                              ),
                              ),
                              ),
                              ),
                           

                            ],
                           )
                         
                          
                           
                        
                        
                        
                        
                        ],
                      
                    )
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

List<DataRow> _getDataRow() {
  List<DataRow> rows = [];
  rows.add(DataRow(cells: [
    DataCell(Text("EMT")),
    DataCell(Text("Grupo 1")),
    DataCell(Row(
      children: [
       boxoption("Estudiantes"),
        boxoption("Docentes"),
        boxoption('Horario\nUbicacion'),
       //icono editar
       IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => {},
        ),
        //icono eliminar
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => {},)

      ],
    ))
  ]));

  return rows;
}

Container boxoption(String name) {
  return Container(
    width: 118,
    height: 34,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Color.fromARGB(255, 61, 61, 61),
          width: 2,
        ),
      ),
      child: TextButton(
        onPressed: () => {},
        child: Text(
          name,
          style:
              TextStyle(color: Color.fromARGB(255, 61, 61, 61), 
              fontSize: 12),
        ),
      ));
}
