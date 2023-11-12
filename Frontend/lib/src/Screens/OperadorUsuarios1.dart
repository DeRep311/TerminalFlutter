import 'package:flutter/material.dart';
import 'package:my_app/src/Data/UsersData.dart';

import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Header/header.dart';
import 'package:my_app/src/Widgets/Layout.dart';

class UsersOperador extends StatefulWidget {
  const UsersOperador({Key? key}) : super(key: key);

  @override
  _UsersOperadorState createState() => _UsersOperadorState();
}

class _UsersOperadorState extends State<UsersOperador> {
  List<UsersModel> users =
      []; // Asegúrate de tener la lista de usuarios actualizada

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        var response = GetAll();
    setState(() {
      response.then((value) => users = value);
      
    });

     
  }

  void actualizarUsuarios() {
    var response = GetAll();

    setState(() {
      response.then((value) => users = value);
      // Actualiza el estado del widget padre
      // Puedes asignar la nueva lista de usuarios o hacer cualquier otra actualización necesaria.
      // users = nuevaListaDeUsuarios;
    });
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
              BackButton(),
              ElevatedButton(
                onPressed: () {
                  // Cuando se presiona el botón, llama a la función de actualización del widget padre
                  actualizarUsuarios();
                },
                child: Text('Actualizar Usuarios'),
              ),
              // Pasa la lista de usuarios al widget hijo
              Table(
                users: users,
                actualizarUsuarios: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Table extends StatefulWidget {
  final List<UsersModel> users;
  final VoidCallback actualizarUsuarios; // Función de actualización

  const Table({
    Key? key,
    required this.users,
    required this.actualizarUsuarios,
  }) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  // Método para construir las filas de la DataTable
  List<DataRow> buildDataRows() {
    return widget.users.map((user) {
      return DataRow(
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
                onPressed: () {
                  // Acciones para editar
                  // ...
                },
              ),
              // Icono eliminar
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
      );
    }).toList();
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
            rows: buildDataRows(), // Usa el método para construir las filas
          ),
        ),
      ),
    );
  }
}
