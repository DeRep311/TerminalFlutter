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
    List<String> dropdownValueDia = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado'
    ];
    List<String> dropdownValueGrupo = [
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
    String? selectedGrupo;
    String? selectedDia;
    String? selectedHoraInicio;
    String? selectedHoraFin;
    String? selectedSalon;

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
                  label: "Elija el grupo...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueGrupo,
                  selectedValue: selectedGrupo,
                  OnChanged: (value) {
                    setState(() {
                      selectedGrupo = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                ),
                DropDownSelect(
                  label: "Elija el dia...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueDia,
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
                DropDownSelect(
                  label: "Elija la materia...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueGrupo,
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
                DropDownSelect(
                  label: "Elija el docente...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueGrupo,
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
                DropDownSelect(
                  label: "Elija el horario...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueGrupo,
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
                DropDownSelect(
                  label: "Elija el salon...",
                  color: Color.fromARGB(110, 231, 227, 227),
                  options: dropdownValueGrupo,
                  selectedValue: selectedDia,
                  OnChanged: (value) {
                    setState(() {
                      selectedDia = value;
                    });
                  },
                ),
                // Campo de texto para la hora de inicio
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                ),

                // Botones para crear y cancelar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Lógica para guardar el horario

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
              const Header(nameOption: 'Operador'),
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
                      MainDataTableHorarios(),
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

class MainDataTableHorarios extends StatefulWidget {
  @override
  _MainDataTableHorariosState createState() => _MainDataTableHorariosState();
}

class _MainDataTableHorariosState extends State<MainDataTableHorarios> {
  List<Map<String, dynamic>> data = [
    {
      'Grupo': 'A1',
      'Docente': 'Ana García',
      'Materia': 'Matematicas',
      'Horario': '7:00-7:45',
      'Dia': 'Lunes',
      'Salon': '105'
    },
    {
      'Grupo': 'A2',
      'Docente': 'Juan Mendez',
      'Materia': 'Filosofia',
      'Horario': '9:15-11:05',
      'Dia': 'Miercoles',
      'Salon': '205'
    },
    {
      'Grupo': 'B1',
      'Docente': 'Pablo Rodriguez',
      'Materia': 'Sistmas Operativos',
      'Horario': '7:00-7:45',
      'Dia': 'Martes',
      'Salon': '109'
    },
    {
      'Grupo': 'B2',
      'Docente': 'Mauro Lombardo',
      'Materia': 'Ingles',
      'Horario': '7:45-8:30',
      'Dia': 'Lunes',
      'Salon': '203'
    },
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
                'Grupo',
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
                'Dia',
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
                DataCell(Text(item['Grupo'])),
                DataCell(Text(item['Docente'])),
                DataCell(Text(item['Materia'])),
                DataCell(Text(item['Horario'])),
                DataCell(Text(item['Dia'])),
                DataCell(Text(item['Salon'])),
                DataCell(Row(
                  children: <Widget>[
                    //icono editar
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => {_EditarHorarios(context)},
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

void _EditarHorarios(BuildContext context) {
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
  String? selectedGrupo;
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
          title: const Text('Editar horario'),
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
                    label: "Edite el grupo...",
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
                    label: "Edite el dia...",
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
                    label: "Edite la materia...",
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
                    label: "Edite el docente...",
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
                    label: "Edite el horario...",
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
                    label: "Edite el salon...",
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

void setState(Null Function() param0) {}

void _AgregarHorarios(BuildContext context) {
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
  String? selectedGrupo;
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
          title: const Text('Editar horario'),
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
                    label: "Elija un grupo...",
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
                    label: "Elija una materia...",
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
                    label: "Elija un docente...",
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
                    label: "Elija un salon...",
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











// class HorariosDataTable extends StatefulWidget {
//   List<HorariosModel> horarios = [];

//   HorariosDataTable({required this.horarios});

//   @override
//   _HorariosDataTableState createState() => _HorariosDataTableState();
// }

// class _HorariosDataTableState extends State<HorariosDataTable> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: DataTable(
//         columns: [
//           DataColumn(
//             label: Text('Grupo'),
//           ),
//           DataColumn(
//             label: Text('Docente'),
//           ),
//           DataColumn(
//             label: Text('Materia'),
//           ),
//           DataColumn(
//             label: Text('Hora inicio'),
//           ),
//           DataColumn(
//             label: Text('Hora fin'),
//           ),
//           DataColumn(
//             label: Text('Día'),
//           ),
//           DataColumn(
//             label: Text('Salón'),
//           ),
//         ],
//         rows: widget.horarios
//             .map(
//               (horario) => DataRow(
//                 cells: [
//                   DataCell(Text(horario.grupo)),
//                   DataCell(Text(horario.docente)),
//                   DataCell(Text(horario.materia)),
//                   DataCell(Text(horario.horaInicio)),
//                   DataCell(Text(horario.horaFin)),
//                   DataCell(Text(horario.nombreDia)),
//                   DataCell(Text(horario.salon)),
//                 ],
//                 selected: horario.selected,
//                 onSelectChanged: (value) {
//                   setState(() {
//                     horario.selected = value!;
//                   });
//                 },
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
