import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/Data/UsersData.dart';

import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Header/header.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Layout.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

class UsersOperador extends StatefulWidget {
  const UsersOperador({Key? key}) : super(key: key);

  @override
  _UsersOperadorState createState() => _UsersOperadorState();
}


class _UsersOperadorState extends State<UsersOperador> {
  List<UsersModel> users = [];

  @override
  void initState() {
    super.initState();
    // Inicia la carga inicial de usuarios
    cargarUsuarios();
  }

  void cargarUsuarios() async {
    var response = await GetAll();
    setState(() {
      users = response;
    });
  }

  void actualizarUsuarios() async {
    // Realiza la carga de usuarios actualizada
    cargarUsuarios();
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
                      Table(
                        users: users,
                        actualizarUsuarios: actualizarUsuarios,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _addUserButton(context, onSaved: actualizarUsuarios),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              actualizarUsuarios();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
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

class Table extends StatefulWidget {
  final List<UsersModel> users;
  final VoidCallback actualizarUsuarios;

  const Table({
    Key? key,
    required this.users,
    required this.actualizarUsuarios,
  }) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  @override
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
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Acciones para editar
                              // ...
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Cuando se presiona el botón, llama a la función de actualización del widget padre
                              widget.actualizarUsuarios();
                            },
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

ElevatedButton _addUserButton(context, {required Function() onSaved}) {
  TextEditingController cedulaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final RegExp cedulaRegExp = RegExp(r'^\d{1,8}$');
  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');
  final RegExp telefonoRegExp = RegExp(r'^\d+$');
  final RegExp pinRegExp = RegExp(r'^\d{4}$');
  String? selectedRol;

  List<String> dropdownValueRol = ['Operador', 'Docente', 'Estudiante'];

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
                    onSaved();
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

  return ElevatedButton(
    onPressed: () {
      _showAddUserDialog();
    },
    child: Text('Agregar usuario'),
     style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
  );
}
