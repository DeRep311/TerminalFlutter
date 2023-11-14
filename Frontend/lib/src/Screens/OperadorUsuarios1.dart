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
  Future<void> deleteUser(int cedula) async {
    await Delete(cedula);
    widget.actualizarUsuarios();
  }

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
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // When the button is pressed, call the delete function
                              deleteUser(user.cedula);
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
  TextEditingController direccionController = TextEditingController();
  TextEditingController rolController = TextEditingController();

  final RegExp cedulaRegExp = RegExp(r'^\d{1,8}$');
  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');
  final RegExp telefonoRegExp = RegExp(r'^\d+$');
  final RegExp pinRegExp = RegExp(r'^\d{4}$');
  String? selectedRol;

  List<String> dropdownValueRol = ['Operador', 'Docente', 'Estudiante'];

  List<String> dropdownValueRolOperador = ['Docente', 'Estudiante'];
  List<String> dropdownValueRolAdministrador = [
    'Operador',
    'Docente',
    'Estudiante'
  ];

//var role = Provider.of<UserModel>(context).userRole;

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
                    controller: direccionController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
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
                // if(role == 'Administrador'){

                // },
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextFormField(
                    controller: rolController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Rol ej: "Docente"',
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
                    validator: (value) {
                      if (value != 'Operador' ||
                          value != 'Administrador' ||
                          value != 'Docente' ||
                          value != 'Estudiante') {
                        return 'Please enter a valid role';
                      }
                      return null;
                    },
                  ),
                ),

                // DropDownSelect(
                //   label: "Elija un rol...",
                //   color: Color.fromARGB(110, 231, 227, 227),
                //   options: dropdownValueRolOperador,
                //   selectedValue: selectedRol,
                //   OnChanged: (value) {
                //     setState(() {
                //       selectedRol = value;
                //     });
                //   },
                // ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Obtener los valores ingresados en los controladores

                //String rol = "";
                //String selectedRol = rol;
                int cedula = int.parse(cedulaController.text);
                String nombre = nombreController.text;
                String apellido = apellidoController.text;
                int telefono = int.parse(telefonoController.text);
                int pin = int.parse(pinController.text);
                int direccion = int.parse(direccionController.text);
                String rol = rolController.text;
                if (rol == 'Operador' ||
                    rol == 'Administrador' ||
                    rol == 'Docente' ||
                    rol == 'Estudiante') {
                  //int pin = pinText.isEmpty ? 0 : int.parse(pinText);
                  // Crear un nuevo objeto UsersModel
                  UsersModel newUser = UsersModel(
                      cedula: cedula,
                      nombre: nombre,
                      apellido: apellido,
                      telefono: telefono,
                      direccion: direccion,
                      pin: pin,
                      rol: rol
                      // Asegúrate de ajustar los atributos según la definición de tu modelo
                      );

                  // for (var user in newUser) {
                  //   print(
                  //       'Cedula: ${user.cedula}, Nombre: ${user.nombre} ${user.apellido}, Rol: ${user.rol}');
                  // }

                  print(newUser);
                  // Llamar a la función Add para agregar el nuevo usuario
                  await Add(newUser);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Rol erroneo, asegurese de la escritura del rol ej "Operador" "Docente" "Administrador" "Estudiante"'),
                      backgroundColor:
                          Colors.red, // Set the background color to red
                    ),
                  );

                  print("DATOS ERRONEos");
                }
                // Cerrar el diálogo
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
