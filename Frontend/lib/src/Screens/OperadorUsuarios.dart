import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Screens/OperadorCursosAdministrar.dart';
import 'package:my_app/src/Widgets/CheckBox.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';
import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

class OperadorUsuariosScreen extends StatefulWidget {
  const OperadorUsuariosScreen({Key? key}) : super(key: key);

  @override
  _OperadorUsuariosScreenState createState() => _OperadorUsuariosScreenState();
}

class _OperadorUsuariosScreenState extends State<OperadorUsuariosScreen> {
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

  List<String> dropdownValueRol = ['Operador', 'Docente', 'Estudiante'];

  @override
  void initState() {
    super.initState();
    // Llamada a la función para obtener los usuarios al iniciar el widget

    resp();
  }

  Future<void> resp() async {
    users = await GetAll();

    // print(users);
    // print("------------------------------------");
    // for (var user in users) {
    //   print(
    //       'Cedula: ${user.cedula}, Nombre: ${user.nombre} ${user.apellido}, Rol: ${user.rol}');
    // }
  }

  void _showAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar usuario'),
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
                    controller: cedulaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
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
                // ... (otros campos del formulario)
                DropDownSelect(
                  label: "Elija un rol...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueRol,
                  selectedValue: selectedRol,
                  OnChanged: (value) {
                    setState(() {
                      selectedRol = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para guardar el usuario
                print(users);

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
                      MainDataTable(
                          users:
                              users), // Llamada al método que construye el DataTable
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
                            onPressed: () {
                              setState(() {
                                resp();
                              });
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

class MainDataTable extends StatefulWidget {
  final List<UsersModel> users;

  const MainDataTable({
    required this.users,
  });

  @override
  _MainDataTableState createState() => _MainDataTableState();
}

class _MainDataTableState extends State<MainDataTable> {
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
                  'Cedula',
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
                  'Apellido',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rol',
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
            rows: widget.users
                .map(
                  (user) => DataRow(
                    cells: [
                      DataCell(Text(user.cedula.toString())),
                      DataCell(Text(user.nombre)),
                      DataCell(Text(user.apellido)),
                      DataCell(Text(user.rol ?? '')),
                      DataCell(Row(
                        children: <Widget>[
                          // Icono editar
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => {},
                          ),
                          // Icono eliminar
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => setState(() {}),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

void _EditarUsuarios(BuildContext context) {
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

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Editar usuario'),
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
                  controller: cedulaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
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
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: nombreController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(nombreRegExp),
                  ],
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
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: apellidoController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(nombreRegExp),
                  ],
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
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
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
              DropDownSelect(
                label: "Elija un rol...",
                color: Color.fromARGB(110, 231, 227, 227),
                options: dropdownValueRol,
                selectedValue: selectedRol,
                OnChanged: (value) {
                  setState(() {
                    selectedRol = value;
                  });
                },
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
//               widget.users.sort((a, b) => (a.cedula).compareTo(b.cedula));
//             },
//           ),
//           DataColumn(
//             label: Text('Nombre'),
//             onSort: (columnIndex, ascending) {
//               // Ordenar la lista de usuarios por nombre.
//               widget.users.sort((a, b) => (a.nombre).compareTo(b.nombre));
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
//                   DataCell(Text(user.cedula.toString())),
//                   DataCell(Text(user.nombre)),
//                   DataCell(Text(user.rol ?? '')),
//                 ],
//                 selected: user.selected,
//                 onSelectChanged: (value) {
//                   setState(() {
//                     //user.selected = value!;
//                   });
//                 },
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
