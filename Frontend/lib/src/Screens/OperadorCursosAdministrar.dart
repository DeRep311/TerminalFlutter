import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/CheckBox.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterCursos.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

import 'package:flutter/services.dart';

class CursosAdministrador extends StatefulWidget {
  const CursosAdministrador({Key? key}) : super(key: key);

  @override
  _CursosAdministradorState createState() => _CursosAdministradorState();
}

class _CursosAdministradorState extends State<CursosAdministrador> {
  TextEditingController cedulaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final RegExp cedulaRegExp = RegExp(r'^\d{1,8}$');
  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');
  final RegExp telefonoRegExp = RegExp(r'^\d+$');
  final RegExp pinRegExp = RegExp(r'^\d{4}$');

  List<String> columns = ['Cedula', 'Nombre', 'Rol'];
  List<UsersModel> users = [];

  String? selectedRol;

  List<String> dropdownValueRol = [
    'Operador',
    'Docente',
    'Estudiante',
  ];

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

  void _showAddCursoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar curso'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextField(
                    controller: nombreController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(nombreRegExp),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Nombre...',
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
//-------------------------------------------------------------------------------------

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
              Header(nameOption: 'Operador'),
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
                      MainDataTable(),
                      //TableWidget(users: users, columns: columns),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _showAddCursoDialog,
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
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CursosAdministrador()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Actualizar datos'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SearchFilterCursos(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainDataTable extends StatefulWidget {
  @override
  _MainDataTableState createState() => _MainDataTableState();
}

class _MainDataTableState extends State<MainDataTable> {
  List<Map<String, dynamic>> data = [
    {'Tipo': '1', 'Nombre': 'Curso 1'},
    {'Tipo': '2', 'Nombre': 'Curso 2'},
    {'Tipo': '3', 'Nombre': 'Curso 3'},
    {'Tipo': '4', 'Nombre': 'Curso 4'},
    {'Tipo': '5', 'Nombre': 'Curso 5'},
  ];
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      width: 800,
      height: 400,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'ID',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Nombre',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Acciones',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: data.map((item) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(item['Tipo'])),
                DataCell(Text(item['Nombre'])),
                DataCell(Row(
                  children: <Widget>[
                    //icono editar
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => {_EditarCursos(context)},
                    ),
                    //icono eliminar
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => {
                        setState(() {
                          data.remove(item);
                        })
                      },
                    ),
                  ],
                )),
              ],
            );
          }).toList(),
        ),
      ),
    ));
  }
}

void _EditarCursos(BuildContext context) {
  TextEditingController nombreController = TextEditingController();

  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Editar curso'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: nombreController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(nombreRegExp),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Ingrese el nuevo nombre...',
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

void setState(Null Function() param0) {}


// class UsersDataTable extends StatefulWidget {
//   final List<UsersModel> users;

//   const UsersDataTable({
//     required this.users,
//   });

//   @override
//   _UsersDataTableState createState() => _UsersDataTableState();
// }

// class _UsersDataTableState extends State<UsersDataTable> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: DataTable(
//         columns: [
//           DataColumn(
//             label: Text('Cedula'),
//             onSort: (columnIndex, ascending) {
//               // Ordenar la lista de usuarios por cédula.
//               widget.users.sort((a, b) => (a.Cedula).compareTo(b.Cedula));
//             },
//           ),
//           DataColumn(
//             label: Text('Nombre'),
//             onSort: (columnIndex, ascending) {
//               // Ordenar la lista de usuarios por nombre.
//               widget.users.sort((a, b) => (a.Nombre).compareTo(b.Nombre));
//             },
//           ),
//           DataColumn(
//             label: Text('Rol'),
//           ),
//         ],
//         rows: widget.users
//             .map(
//               (user) => DataRow(
//                 cells: [
//                   DataCell(Text(user.Cedula.toString())),
//                   DataCell(Text(user.Nombre)),
//                   DataCell(Text(user.rol ?? '')),
//                 ],
//                 selected: user.selected,
//                 onSelectChanged: (value) {
//                   setState(() {
//                     user.selected = value!;
//                   });
//                 },
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
