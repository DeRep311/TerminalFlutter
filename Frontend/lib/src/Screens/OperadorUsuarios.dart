import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/CheckBox.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';

import 'package:flutter/services.dart';

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
                const TextWithCheckbox(text: 'Operador '),
                const TextWithCheckbox(text: '   Docente'),
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
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OperadorUsuariosScreen()));
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

class TableWidget extends StatefulWidget {
  final List<UsersModel> users;

  var columns;

  TableWidget({required this.users, required this.columns});

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Cedula')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Rol')),
        ],
        rows: [
          for (var user in widget.users)
            DataRow(
              cells: [
                DataCell(Text(user.Cedula.toString())),
                DataCell(Text(user.Nombre)),
                DataCell(Text(user.rol ?? 'Visitante')),
              ],
            ),
        ],
      ),
    );
  }
}
