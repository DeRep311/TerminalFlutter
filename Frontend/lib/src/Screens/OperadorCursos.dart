// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/Providers/Provider_Ubications.dart';
import 'package:my_app/src/Widgets/Button.dart';
import 'package:my_app/src/Widgets/Items/CargarEstudiantesExcel.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Items/FieldRounded.dart';
import 'package:provider/provider.dart';

import '../Widgets/Header/header.dart';
import '../Widgets/Layout.dart';

import 'package:flutter/material.dart';

class OperadorCursos extends StatelessWidget {
  const OperadorCursos({Key? key});

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
                        width: 900,
                        height: 500,
                        child: MainDataTable(),
                        // child: DataTable(
                        //   decoration: BoxDecoration(
                        //     color: Color.fromARGB(255, 255, 255, 255),
                        //   ),
                        //   columns: ["Tipo", "Grupo", "Options"]
                        //       .map((e) => DataColumn(label: Text(e)))
                        //       .toList(),
                        //   rows: _getDataRow(context),
                        // ),
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
                              onPressed: () => {_AgregarGrupos(context)},
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
                              onPressed: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OperadorCursos()))
                              },
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
                      ),
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
                              FieldRounded(
                                  label: "Filtrar Grupo", funtion: null),
                              FieldRounded(
                                  label: "Filtrar Curso", funtion: null),
                              Padding(padding: EdgeInsets.all(15)),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 160.0,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    fixedSize: const Size(100, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: const Text('Buscar'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        '/operador/cursos/administrar');
                                  },
                                  child: Text(
                                    "Administrar cursos",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 61, 61, 61),
                                      fontSize: 14,
                                      fontFamily: "Poppins-Regular",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//--------------------------Pop ups-------------------------------
class DocenteDialog extends StatefulWidget {
  @override
  _DocenteDialogState createState() => _DocenteDialogState();
}

class _DocenteDialogState extends State<DocenteDialog> {
  List<Map<String, dynamic>> data = [
    {'Materia': 'Matemáticas', 'Docente': 'Prof. García'},
    // Add more data here...
  ];
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 500,
        height: 600,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Materia',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Docente',
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
                  DataCell(Text(item['Materia'])),
                  DataCell(Text(item['Docente'])),
                  DataCell(Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => {_EditarMateriasDocentes(context)},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            data.remove(item);
                          });
                        },
                      ),
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _CrearMaterias(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(120, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Crear materia'),
            ),
            SizedBox(width: 16), // Espacio entre los dos primeros botones
            ElevatedButton(
              onPressed: () {
                _AgregarMateriaDocente(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Agregar'),
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ],
    );
  }
}

//------------------Pop up Estudiantes-----------------------------------
class EstudiantesDialog extends StatefulWidget {
  @override
  _EstudiantesDialogState createState() => _EstudiantesDialogState();
}

class _EstudiantesDialogState extends State<EstudiantesDialog> {
  List<Map<String, dynamic>> data = [
    {'Cedula': '55378850', 'Nombre': 'Yan Rodriguez'},
    {'Cedula': '44373150', 'Nombre': 'Momo Benavides'},
    {'Cedula': '45376358', 'Nombre': 'Juan Alpaca'},
    {'Cedula': '45364878', 'Nombre': 'Ysy A'},
    // Add more data here...
  ];
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 500,
        height: 600,
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
                  'Acciones',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: data.map((item) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(item['Cedula'])),
                  DataCell(Text(item['Nombre'])),
                  DataCell(Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => {_EditarMateriasDocentes(context)},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            data.remove(item);
                          });
                        },
                      ),
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _AgregarEstudiantes(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Agregar'),
            ),
            SizedBox(width: 16), // Espacio entre los dos primeros botones
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CargarCedulas(); // Muestra el diálogo para cargar estudiantes.
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(120, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Agregar lista'),
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ],
    );
  }
}

//------------pop up ubicaciones - horarios ----------------

class UbicacionesHorariosDialog extends StatefulWidget {
  @override
  _UbicacionesHorariosDialogState createState() =>
      _UbicacionesHorariosDialogState();
}

class _UbicacionesHorariosDialogState extends State<UbicacionesHorariosDialog> {
  List<Map<String, dynamic>> data = [
    {
      'Dia': 'Lunes',
      'Materia': 'Matematicas',
      'Horario': '9:15 - 11:05',
      'Salon': '102'
    },

    // Add more data here...
  ];
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 550,
        height: 600,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Dia',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Materia',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Horario',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Salon',
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
                  DataCell(Text(item['Dia'])),
                  DataCell(Text(item['Materia'])),
                  DataCell(Text(item['Horario'])),
                  DataCell(Text(item['Salon'])),
                  DataCell(Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => {_EditarMateriasDocentes(context)},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            data.remove(item);
                          });
                        },
                      ),
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _AgregarHorarioUbicaciones(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Agregar'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(90, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ],
    );
  }
}

//------------------Pop up grupos-----------------------------------
class MainDataTable extends StatefulWidget {
  @override
  _MainDataTableState createState() => _MainDataTableState();
}

class _MainDataTableState extends State<MainDataTable> {
  List<Map<String, dynamic>> data = [
    {'Tipo': 'EMT', 'Grupo': 'Grupo 1'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 2'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 3'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 4'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 5'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 6'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 7'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 8'},
    {'Tipo': 'EMT', 'Grupo': 'Grupo 9'},
  ];
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      width: 900,
      height: 500,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Tipo',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Grupo',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Opciones',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: data.map((item) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(item['Tipo'])),
                DataCell(Text(item['Grupo'])),
                DataCell(Row(
                  children: <Widget>[
                    boxoption(
                        "Estudiantes",
                        () => {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return EstudiantesDialog();
                                },
                              )
                            }),
                    boxoption(
                        "Docentes",
                        () => {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DocenteDialog();
                                },
                              )
                            }),
                    boxoption(
                        'Horario\nUbicacion',
                        () => {
                              Navigator.pushNamed(context, '/operador/horarios')
                            }),
                    //icono editar
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => {_EditarGrupos(context)},
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

//----------pop up editar grupos--------------------------
void _EditarGrupos(BuildContext context) {
  TextEditingController grupotipoController = TextEditingController();
  TextEditingController gruponombreController = TextEditingController();

  // Define una expresión regular que solo permite números y limita a 8 dígitos
  final RegExp onlyNumbers = RegExp(r'^[0-9]{1,8}$');
  final RegExp onlyLetters = RegExp(r'^[a-zA-Z]+$');
  // Crea un TextInputFormatter para aplicar la validación
  final onlyNumbersFormatter = FilteringTextInputFormatter.allow(onlyNumbers);
  final onlyLettersFormatter = FilteringTextInputFormatter.allow(onlyLetters);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Editar grupo'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Campo de texto para la materia
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: grupotipoController,
                  decoration: InputDecoration(
                    hintText: 'Tipo de grupo...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  inputFormatters: [
                    onlyLettersFormatter
                  ], // Apply the formatter to restrict input
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: gruponombreController,
                  decoration: InputDecoration(
                    hintText: 'Nombre del grupo...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
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
              // Botones para crear y cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Lógica para guardar la materia
                      // final materia = materiaController.text;
                      // if (onlyNumbers.hasMatch(materia)) {
                      //   // Solo si la entrada son números y no excede 8 dígitos
                      //   // Guarda la materia o realiza la lógica necesaria
                      //   // ...

                      //   Navigator.of(context).pop();
                      // } else {
                      //   // Muestra un mensaje de error si no cumple con las condiciones
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content:
                      //           Text('Por favor, ingrese hasta 8 números.'),
                      //     ),
                      //   );
                      // }
                    },
                    child: const Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

List<DataRow> _getDataRow(BuildContext context) {
  List<DataRow> rows = [];
  rows.add(DataRow(cells: [
    DataCell(Text("EMT")),
    DataCell(Text("Grupo 1")),
    DataCell(Row(
      children: [
        boxoption(
            "Estudiantes",
            () => {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return EstudiantesDialog();
                    },
                  )
                }),
        boxoption(
            "Docentes",
            () => {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DocenteDialog();
                    },
                  )
                }),
        boxoption('Horario\nUbicacion',
            () => {Navigator.pushNamed(context, '/operador/horarios')}),
        //icono editar
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => {},
        ),
        //icono eliminar
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => {},
        ),
      ],
    ))
  ]));

  return rows;
}

Container boxoption(String name, Function() onPressed) {
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
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          color: Color.fromARGB(255, 61, 61, 61),
          fontSize: 12,
        ),
      ),
    ),
  );
}

//Pop up para agregar estudiantes
void _AgregarGrupos(BuildContext context) {
  TextEditingController grupotipoController = TextEditingController();
  TextEditingController gruponombreController = TextEditingController();

  // Define una expresión regular que solo permite números y limita a 8 dígitos
  final RegExp onlyNumbers = RegExp(r'^[0-9]{1,8}$');
  final RegExp onlyLetters = RegExp(r'^[a-zA-Z]+$');
  // Crea un TextInputFormatter para aplicar la validación
  final onlyNumbersFormatter = FilteringTextInputFormatter.allow(onlyNumbers);
  final onlyLettersFormatter = FilteringTextInputFormatter.allow(onlyLetters);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Crear grupo'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Campo de texto para la materia
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: grupotipoController,
                  decoration: InputDecoration(
                    hintText: 'Tipo de grupo...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  inputFormatters: [
                    onlyLettersFormatter
                  ], // Apply the formatter to restrict input
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: gruponombreController,
                  decoration: InputDecoration(
                    hintText: 'Nombre del grupo...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
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
              // Botones para crear y cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Lógica para guardar la materia
                      // final materia = materiaController.text;
                      // if (onlyNumbers.hasMatch(materia)) {
                      //   // Solo si la entrada son números y no excede 8 dígitos
                      //   // Guarda la materia o realiza la lógica necesaria
                      //   // ...

                      //   Navigator.of(context).pop();
                      // } else {
                      //   // Muestra un mensaje de error si no cumple con las condiciones
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content:
                      //           Text('Por favor, ingrese hasta 8 números.'),
                      //     ),
                      //   );
                      // }
                    },
                    child: const Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

//Pop up para agregar estudiantes

void _AgregarListaEstudiantes(BuildContext context) {
  TextEditingController materiaController = TextEditingController();

  // Define una expresión regular que solo permite números y limita a 8 dígitos
  final RegExp onlyNumbers = RegExp(r'^[0-9]{1,8}$');

  // Crea un TextInputFormatter para aplicar la validación
  final onlyNumbersFormatter = FilteringTextInputFormatter.allow(onlyNumbers);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Agregar estudiante'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Campo de texto para la materia
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: materiaController,
                  inputFormatters: [
                    onlyNumbersFormatter
                  ], // Aplica el validador
                  decoration: InputDecoration(
                    hintText: 'Cedula...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
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

              // Botones para crear y cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Lógica para guardar la materia
                      final materia = materiaController.text;
                      if (onlyNumbers.hasMatch(materia)) {
                        // Solo si la entrada son números y no excede 8 dígitos
                        // Guarda la materia o realiza la lógica necesaria
                        // ...

                        Navigator.of(context).pop();
                      } else {
                        // Muestra un mensaje de error si no cumple con las condiciones
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Por favor, ingrese hasta 8 números.'),
                          ),
                        );
                      }
                    },
                    child: const Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

//Pop up para agregar horarios y ubicaciones
void _AgregarHorarioUbicaciones(BuildContext context) {
  List<String> dropdownValueDia = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado'
  ];

  List<String> dropdownValueHoraIncio = [
    '7:00'
        '7:45',
    '8:35',
    '9:15',
    '10:00',
    '10:20',
    '11:05',
    '11:50'
  ];
  List<String> dropdownValueHoraFin = [
    '7:45',
    '8:35',
    '9:15',
    '10:00',
    '10:20',
    '11:05',
    '11:50'
  ];
  List<String> dropdownValueSalon = ['102', '103', '104'];
  String? selectedDia;
  String? selectedHoraInicio;
  String? selectedHoraFin;
  String? selectedSalon;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(// Wrap your AlertDialog in a StatefulBuilder
          builder: (context, setState) {
        return AlertDialog(
          title: const Text('Asignar materia a docente'),
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
                  child: DropDownSelect(
                    label: "Elija un dia...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValueDia,
                    selectedValue: selectedDia,
                    OnChanged: (value) {
                      setState(() {
                        selectedDia = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DropDownSelect(
                    label: "Elija la materia...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValueHoraIncio,
                    selectedValue: selectedHoraInicio,
                    OnChanged: (value) {
                      setState(() {
                        selectedHoraInicio = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DropDownSelect(
                    label: "Elija un horario...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValueHoraFin,
                    selectedValue: selectedHoraFin,
                    OnChanged: (value) {
                      setState(() {
                        selectedHoraFin = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DropDownSelect(
                    label: "Elija el salon...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValueSalon,
                    selectedValue: selectedSalon,
                    OnChanged: (value) {
                      setState(() {
                        selectedSalon = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para guardar el usuario
                // print(selectedDocente);
                // print(selectedMateria);

                // if (selectedDocente != null && selectedMateria != null) {
                //   // Assuming that 'data' is a variable in the state of your DocenteDialog widget
                //   setState(() {
                //     List<Map<String, dynamic>> data = [
                //       {'Materia': 'Matemáticas', 'Docente': 'Prof. García'},
                //       {'Materia': 'Física', 'Docente': 'Prof. Pérez'},
                //     ];
                //     data.add({
                //       'Materia': selectedMateria,
                //       'Docente': selectedDocente,
                //     });
                //   });
                // }
                Navigator.of(context).pop();
              },
              child: const Text('Crear'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      });
    },
  );
}

//Pop up para agregar estudiantes
void _AgregarEstudiantes(BuildContext context) {
  TextEditingController materiaController = TextEditingController();

  // Define una expresión regular que solo permite números y limita a 8 dígitos
  final RegExp onlyNumbers = RegExp(r'^[0-9]{1,8}$');

  // Crea un TextInputFormatter para aplicar la validación
  final onlyNumbersFormatter = FilteringTextInputFormatter.allow(onlyNumbers);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Agregar estudiante'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Campo de texto para la materia
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: materiaController,
                  inputFormatters: [
                    onlyNumbersFormatter
                  ], // Aplica el validador
                  decoration: InputDecoration(
                    hintText: 'Cedula...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
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

              // Botones para crear y cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Lógica para guardar la materia
                      final materia = materiaController.text;
                      if (onlyNumbers.hasMatch(materia)) {
                        // Solo si la entrada son números y no excede 8 dígitos
                        // Guarda la materia o realiza la lógica necesaria
                        // ...

                        Navigator.of(context).pop();
                      } else {
                        // Muestra un mensaje de error si no cumple con las condiciones
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Por favor, ingrese hasta 8 números.'),
                          ),
                        );
                      }
                    },
                    child: const Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

//Pop up para asignar materias a docentes

void _AgregarMateriaDocente(BuildContext context) {
  List<String> dropdownValue = [
    'Option1',
    'Option2',
    'Option3'
  ]; // Add your options here

  String? selectedDocente;
  String? selectedMateria;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(// Wrap your AlertDialog in a StatefulBuilder
          builder: (context, setState) {
        return AlertDialog(
          title: const Text('Asignar materia a docente'),
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
                  child: DropDownSelect(
                    label: "Elija un docente...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValue,
                    selectedValue: selectedDocente,
                    OnChanged: (value) {
                      setState(() {
                        selectedDocente = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DropDownSelect(
                    label: "Elija una materia...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValue,
                    selectedValue: selectedMateria,
                    OnChanged: (value) {
                      setState(() {
                        selectedMateria = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para guardar el usuario
                print(selectedDocente);
                print(selectedMateria);

                if (selectedDocente != null && selectedMateria != null) {
                  // Assuming that 'data' is a variable in the state of your DocenteDialog widget
                  setState(() {
                    List<Map<String, dynamic>> data = [
                      {'Materia': 'Matemáticas', 'Docente': 'Prof. García'},
                      {'Materia': 'Física', 'Docente': 'Prof. Pérez'},
                    ];
                    data.add({
                      'Materia': selectedMateria,
                      'Docente': selectedDocente,
                    });
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Crear'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      });
    },
  );
}

//Pop up para crear materias

void _CrearMaterias(BuildContext context) {
  TextEditingController materiaController = TextEditingController();

  // Define una expresión regular que solo permite letras
  final RegExp onlyLetters = RegExp(r'^[a-zA-Z]+$');

  // Crea un TextInputFormatter para aplicar la validación
  final onlyLettersFormatter = FilteringTextInputFormatter.allow(onlyLetters);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Crear materia'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Campo de texto para la materia
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: TextField(
                  controller: materiaController,
                  inputFormatters: [
                    onlyLettersFormatter
                  ], // Aplica el validador
                  decoration: InputDecoration(
                    hintText: 'Materia...',
                    fillColor: const Color.fromARGB(110, 231, 227, 227),
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

              // Botones para crear y cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Lógica para guardar la materia
                      final materia = materiaController.text;
                      if (onlyLetters.hasMatch(materia)) {
                        // Solo si la entrada son letras
                        // Guarda la materia o realiza la lógica necesaria
                        // ...

                        Navigator.of(context).pop();
                      } else {
                        // Muestra un mensaje de error si no son solo letras
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Por favor, ingrese solo letras.'),
                          ),
                        );
                      }
                    },
                    child: const Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

//Pop up para editar materias a docentes

void _EditarMateriasDocentes(BuildContext context) {
  List<String> dropdownValue = [
    'Option1',
    'Option2',
    'Option3'
  ]; // Add your options here

  String? selectedOption;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(// Wrap your AlertDialog in a StatefulBuilder
          builder: (context, setState) {
        return AlertDialog(
          title: const Text('Editar'),
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
                  child: DropDownSelect(
                    label: "Elija un docente...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValue,
                    selectedValue: selectedOption,
                    OnChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DropDownSelect(
                    label: "Elija una materia...",
                    color: Color.fromARGB(110, 231, 227, 227),
                    options: dropdownValue,
                    selectedValue: selectedOption,
                    OnChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
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
              child: const Text('Crear'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      });
    },
  );
}

// class OperadorCursos extends StatelessWidget {
//   const OperadorCursos({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: const Color.fromRGBO(255, 255, 255, 1),
//         child: Layout(
//             children: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Header(nameOption: "Operador"),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 BackButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   color: Colors.white,
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Colors.transparent),
//                     overlayColor:
//                         MaterialStateProperty.all<Color>(Colors.transparent),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                      Container(
//                   margin: EdgeInsets.only(top: 20),
//                   width: 700,
//                   height: 500,
//                   child: DataTable(
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                       columns: ["Tipo", "Grupo", "Options"]
//                           .map((e) => DataColumn(label: Text(e)))
//                           .toList(),
//                       rows: _getDataRow()),
//                 ),
//                 Row(

//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                       width: 100,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                       child: TextButton(
//                         onPressed: () => {},
//                         child: Text(
//                           "Agregar",
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 61, 61, 61),
//                             fontSize: 12,
//                             fontFamily: "Poppins-Regular",
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                       width: 100,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                       child: TextButton(
//                         onPressed: () => {},
//                         child: Text(
//                           "Eliminar",
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 61, 61, 61),
//                             fontSize: 12,
//                             fontFamily: "Poppins-Regular",
//                           ),
//                         ),
//                       ),
//                     ),
//                      Container(
//                         margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                       width: 100,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(24.0),
//                       ),
//                       child: TextButton(
//                         onPressed: () => {},
//                         child: Text(
//                           "Actualizar",
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 61, 61, 61),
//                             fontSize: 12,
//                             fontFamily: "Poppins-Regular",
//                           ),
//                         ),
//                       ),
//                     ),

//                   ],
//                 )

//                   ],
//                 ),

//                 SizedBox(
//                   height: 500,
//                   width: 300,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 20),
//                       decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(24.0),
//                     color: Color.fromARGB(255, 61, 61, 61),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0x40000000),
//                         offset: Offset(0.0, 4.0),
//                         blurRadius: 4.0,
//                         spreadRadius: 0,
//                       ),

//                     ],

//                   ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           children: [
//                              FieldRounded(label: "Filtrar Grupo", funtion:null),
//                            FieldRounded(label: "Filtrar Curso", funtion:null),

//                           ],
//                         ),
//                         Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                                Container(
//                             width: 100,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(24.0),

//                             ),
//                             child: TextButton(
//                               onPressed: () => {},
//                               child: Text("Administrar\nhorarios",style: TextStyle(
//                                 color: Color.fromARGB(255, 61, 61, 61),
//                                 fontSize: 12,
//                                 fontFamily: "Poppins-Regular",
//                               ),
//                               ),
//                               ),
//                               ),
//                                Container(
//                             width: 100,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(24.0),

//                             ),
//                             child: TextButton(
//                               onPressed: () => {
//                                 Navigator.pushNamed(context, '/operador/cursos/administrar')
//                               },
//                               child: Text("Administrar\nCursos",style: TextStyle(
//                                 color: Color.fromARGB(255, 61, 61, 61),
//                                 fontSize: 12,
//                                 fontFamily: "Poppins-Regular",
//                               ),
//                               ),
//                               ),
//                               ),

//                             ],
//                            )

//                         ],

//                     )
//                   ),
//                 ),
//               ],
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

// List<DataRow> _getDataRow() {
//   List<DataRow> rows = [];
//   rows.add(DataRow(cells: [
//     DataCell(Text("EMT")),
//     DataCell(Text("Grupo 1")),
//     DataCell(Row(
//       children: [
//        boxoption("Estudiantes"),
//         boxoption("Docentes"),
//         boxoption('Horario\nUbicacion'),
//        //icono editar
//        IconButton(
//           icon: Icon(Icons.edit),
//           onPressed: () => {},
//         ),
//         //icono eliminar
//         IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () => {},)

//       ],
//     ))
//   ]));

//   return rows;
// }

// Container boxoption(String name) {
//   return Container(
//     width: 118,
//     height: 34,
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 255, 255, 255),
//         borderRadius: BorderRadius.circular(24.0),
//         border: Border.all(
//           color: Color.fromARGB(255, 61, 61, 61),
//           width: 2,
//         ),
//       ),
//       child: TextButton(
//         onPressed: () => {},
//         child: Text(
//           name,
//           style:
//               TextStyle(color: Color.fromARGB(255, 61, 61, 61),
//               fontSize: 12),
//         ),
//       ));
// }
