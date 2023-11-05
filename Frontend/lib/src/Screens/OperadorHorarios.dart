import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/Data/UsersData.dart';
import 'package:my_app/src/Models/HorariosModel.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/CheckBox.dart';
import 'package:my_app/src/Widgets/Header/Header.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';
import 'package:my_app/src/Widgets/Layout.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

class OperadorHorariosScreen extends StatefulWidget {
  const OperadorHorariosScreen({Key? key}) : super(key: key);

  @override
  _OperadorHorariosScreenState createState() => _OperadorHorariosScreenState();
}

final horarios = [
  HorariosModel(
      grupo: '1B',
      docente: 'Juan Alpaca',
      materia: 'Matemáticas',
      horaInicio: '8:00',
      horaFin: '9:00',
      nombreDia: 'Lunes',
      salon: 'A-101'),
  HorariosModel(
      grupo: '2A',
      docente: 'María González',
      materia: 'Inglés',
      horaInicio: '9:00',
      horaFin: '10:00',
      nombreDia: 'Martes',
      salon: 'B-201'),
];

class _OperadorHorariosScreenState extends State<OperadorHorariosScreen> {
  TextEditingController horainicioController = TextEditingController();
  TextEditingController horafinController = TextEditingController();

  List<String> columns = ['Cedula', 'Nombre', 'Rol'];
  List<UsersModel> users = [];
  // List<HorariosModel> horarios = [];

  bool operadorCheckbox = false;
  bool administradorCheckbox = false;
  bool docenteCheckbox = false;
  bool estudianteCheckbox = false;

  // @override
  // void initState() {
  //   super.initState();
  //   // Llamada a la función para obtener los usuarios al iniciar el widget
  //   resp();
  // }

  // Future<void> resp() async {
  //   var response = await GetAll();

  //   setState(() {
  //     horarios = response.cast<HorariosModel>();
  //   });
  // }

  void _CrearHorarios() {
    List<String> dropdownValue = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado'
    ];
    String? selectedDia;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Crear horario'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Dropdown para seleccionar el día de la semana
                DropDownSelect(
                  label: "Elija un día de la semana...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValue,
                  selectedValue: selectedDia,
                  OnChanged: (value) {
                    setState(() {
                      selectedDia = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                ),
                // Campo de texto para la hora de inicio
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextField(
                    controller: horainicioController,
                    decoration: InputDecoration(
                      hintText: 'Hora inicio',
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

                // Campo de texto para la hora de fin
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextField(
                    controller: horafinController,
                    decoration: InputDecoration(
                      hintText: 'Hora fin',
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
                        // Lógica para guardar el horario

                        // ...

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
                ),
              ],
            ),
          ),
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
              const Header(nameOption: 'Visitante'),
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
                        width: 900,
                        height: 362,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 254, 254)),
                          child: HorariosDataTable(horarios: horarios),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _CrearHorarios,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: const Color.fromRGBO(0, 0, 0, 1),
                              fixedSize: const Size(116, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Crear horario'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              print(horarios);
                            },
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
                                          const OperadorHorariosScreen()));
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
                  const SearchFilterHorarios(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorariosDataTable extends StatefulWidget {
  List<HorariosModel> horarios = [];

  HorariosDataTable({required this.horarios});

  @override
  _HorariosDataTableState createState() => _HorariosDataTableState();
}

class _HorariosDataTableState extends State<HorariosDataTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('Grupo'),
          ),
          DataColumn(
            label: Text('Docente'),
          ),
          DataColumn(
            label: Text('Materia'),
          ),
          DataColumn(
            label: Text('Hora inicio'),
          ),
          DataColumn(
            label: Text('Hora fin'),
          ),
          DataColumn(
            label: Text('Día'),
          ),
          DataColumn(
            label: Text('Salón'),
          ),
        ],
        rows: widget.horarios
            .map(
              (horario) => DataRow(
                cells: [
                  DataCell(Text(horario.grupo)),
                  DataCell(Text(horario.docente)),
                  DataCell(Text(horario.materia)),
                  DataCell(Text(horario.horaInicio)),
                  DataCell(Text(horario.horaFin)),
                  DataCell(Text(horario.nombreDia)),
                  DataCell(Text(horario.salon)),
                ],
                selected: horario.selected,
                onSelectChanged: (value) {
                  setState(() {
                    horario.selected = value!;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
