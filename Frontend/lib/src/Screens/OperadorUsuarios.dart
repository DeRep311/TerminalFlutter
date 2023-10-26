import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/UsersDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/CheckBox.dart';
import 'package:my_app/src/Widgets/Items.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

import 'package:flutter/material.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/UsersDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Header/Header.dart';
import 'package:my_app/src/Widgets/Layout.dart';

class OperadorUsuariosScreen extends StatefulWidget {
  const OperadorUsuariosScreen({Key? key}) : super(key: key);

  @override
  _OperadorUsuariosScreenState createState() => _OperadorUsuariosScreenState();
}

class _OperadorUsuariosScreenState extends State<OperadorUsuariosScreen> {
  List<String> columns = ['Cedula', 'Nombre', 'Rol'];
  List<UsersModel> users = [];

  bool operadorCheckbox = false;
  bool administradorCheckbox = false;
  bool docenteCheckbox = false;
  bool estudianteCheckbox = false;

  @override
  void initState() {
    super.initState();
    // Llamada a la función para obtener los usuarios al iniciar el widget
    resp();
  }

  Future<void> resp() async {
    var response = await GetAll();

    setState(() {
      users = response;
    });
  }

  void _showAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar usuario'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cedula',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Apellido',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Telefono',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Direccion',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Espaciado entre los campos
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pin',
                      fillColor: Color.fromARGB(110, 231, 227, 227),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                const TextWithCheckbox(text: 'Operador'),
                const TextWithCheckbox(text: 'Docente'),
                const TextWithCheckbox(text: 'Estudiante'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para guardar el usuario
                Navigator.of(context).pop();
              },
              child: Text('Guardar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

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
              Header(nameOption: 'Visitante'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BackButton(
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
                      SizedBox(
                        width: 790,
                        height: 362,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 254, 254)),
                          child: TableWidget(users: users, columns: columns),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _showAddUserDialog,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Agregar'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Borrar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SearchFilterUsuarios(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  final List<UsersModel> users;
  final List<String> columns;

  TableWidget({required this.users, required this.columns});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        for (var c in columns) DataColumn(label: Text(c)),
      ],
      rows: [
        for (var u in users)
          DataRow(cells: [
            DataCell(Text(u.Cedula.toString())),
            DataCell(Text(u.Nombre)),
            DataCell(Text(u.rol ?? 'Visitante')),
          ])
      ],
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

//Checkbox
class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
