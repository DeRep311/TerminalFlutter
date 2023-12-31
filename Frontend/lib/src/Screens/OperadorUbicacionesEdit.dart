// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/src/Widgets/Items.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Items/ImageUploader.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
import 'package:my_app/src/Widgets/LeftCards/UbicationsPanel.dart';
import 'package:provider/provider.dart';

import '../Providers/Provider_Ubications.dart';
import '../Widgets/Header/Header.dart';
import '../Widgets/Layout.dart';
import '../Widgets/PanelEditor.dart';

class OperadorUbicaciones extends StatelessWidget {
  const OperadorUbicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    Provider_Ubications ubicationsProvider =
        Provider.of<Provider_Ubications>(context);

    return Scaffold(
        body: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Layout(
                children: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  //Header main screen

                  Header(nameOption: 'Operador'),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BackButton(
                          onPressed: () {
                            ubicationsProvider.disposeclean();
                            Navigator.pop(context);
                          },
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
                            PanelEditor(),
                            SizedBox(
                              width: 900,
                              height: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      ubicationsProvider.saveData();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: const Size(115, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    child: const Text(
                                      'Guardar',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      _AgregarPlanos(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: const Size(150, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    child: const Text(
                                      'Cargar plano',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PlanosDialog();
                                        },
                                      );

                                      PlanosDialog();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: const Size(170, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    child: const Text(
                                      'Mostrar planos',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return UbicacionesDialog();
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: const Size(270, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    child: const Text(
                                      'Administrar ubicaciones',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        UbicationPanel(),
                      ])
                ]))));
  }
}

void _AgregarPlanos(BuildContext context) {
  TextEditingController nombreController = TextEditingController();

  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Agregar planos'),
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
                    hintText: 'Ingrese el nombre del plano...',
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
                    hintText: 'Ingrese el codigo...',
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
              CargarImagenes()
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

class PlanosDialog extends StatefulWidget {
  @override
  _PlanosDialogState createState() => _PlanosDialogState();
}

class _PlanosDialogState extends State<PlanosDialog> {
  List<Map<String, dynamic>> data = [
    {'Codigo': 'baño1', 'Plano': 'Baños primer piso'},
    {'Codigo': 'baño2', 'Plano': 'Baños segundo piso'},
    {'Codigo': 'cant', 'Plano': 'Cantina'},

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
                  'Codigo',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Plano',
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
                  DataCell(Text(item['Codigo'])),
                  DataCell(Text(item['Plano'])),
                  DataCell(Row(
                    children: <Widget>[
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

void _AgregarUbicaciones(BuildContext context) {
  TextEditingController nombreController = TextEditingController();

  String? selectedRol;

  List<String> dropdownValueRol = [
    'Operador',
    'Docente',
    'Estudiante',
  ];

  final RegExp nombreRegExp = RegExp(r'^[a-zA-Z ]+$');

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Agregar planos'),
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
                    hintText: 'Ingrese nombre de la ubicacion...',
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
                label: "Elija el codigo...",
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

class UbicacionesDialog extends StatefulWidget {
  @override
  _UbicacionesDialogState createState() => _UbicacionesDialogState();
}

class _UbicacionesDialogState extends State<UbicacionesDialog> {
  List<Map<String, dynamic>> data = [
    {
      'Codigo': 'Baños1',
      'Nombre': 'Baños primer piso',
      'Privado': false,
      'Publico': false
    },
    {
      'Codigo': 'Baños3',
      'Nombre': 'Baños segundo piso',
      'Privado': false,
      'Publico': false
    },
    {'Codigo': 'Cant', 'Nombre': 'Cantina', 'Privado': false, 'Publico': false},

    // Add more data here...
  ];

  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 700,
        height: 600,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Codigo',
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
                  'Privado',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Publico',
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
                  DataCell(Text(item['Codigo'])),
                  DataCell(Text(item['Nombre'])),
                  DataCell(Checkbox(
                    value: item['Privado'],
                    onChanged: (value) {
                      setState(() {
                        item['Privado'] = value;
                        if (value!) {
                          item['Publico'] = !value;
                        }
                      });
                    },
                  )),
                  DataCell(Checkbox(
                    value: item['Publico'],
                    onChanged: (value) {
                      setState(() {
                        item['Publico'] = value;
                        if (value!) {
                          item['Privado'] = !value;
                        }
                      });
                    },
                  )),
                  DataCell(Row(
                    children: <Widget>[
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
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                _AgregarUbicaciones(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                fixedSize: const Size(160, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(
                  color: Colors
                      .black, // Color del borde al pasar el cursor por encima
                  width: 0.5, // Ancho del borde al pasar el cursor por encima
                ),
              ),
              child: const Text('Agregar ubicacions'),
            ),
          ],
        ),
      ],
    );
  }
}
