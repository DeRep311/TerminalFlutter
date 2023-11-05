import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items/DropDownSelect.dart';

class SearchFilterHorarios extends StatefulWidget {
  const SearchFilterHorarios({Key? key}) : super(key: key);

  @override
  _SearchFilterHorariosState createState() => _SearchFilterHorariosState();
}

class _SearchFilterHorariosState extends State<SearchFilterHorarios> {
  String? selectedDocente;
  String? selectedGrupo;
  String? selectedSalon;

  List<String> dropdownValueDocentes = [
    'Pepe',
    'Juan',
    'Momo',
    'Mauro',
    'El cazcu',
    'Ayuda, el estres me come'
  ];
  List<String> dropdownValueGrupo = [
    'grupo1',
    'Coscu Army',
    'Grupos socialos por Durkheim',
    'Lil durk',
    'C noventa c noventaa',
    'Porque 5 minutos con ella eran 10h con cualquier otro'
  ];
  List<String> dropdownValueSalon = ['102', '9/11', '323', '777', '999', '123'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFF3D3D3D),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 350,
        width: 250,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Filtro de búsqueda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: DropDownSelect(
                label: "Elija un docente...",
                color: Color.fromARGB(255, 255, 255, 255),
                options: dropdownValueDocentes,
                selectedValue: selectedDocente,
                OnChanged: (value) {
                  setState(() {
                    selectedDocente = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: DropDownSelect(
                label: "Elija un grupo...",
                color: Color.fromARGB(255, 255, 255, 255),
                options: dropdownValueGrupo,
                selectedValue: selectedGrupo,
                OnChanged: (value) {
                  setState(() {
                    selectedGrupo = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: DropDownSelect(
                label: "Elija un salon...",
                color: Color.fromARGB(255, 255, 255, 255),
                options: dropdownValueSalon,
                selectedValue: selectedSalon,
                OnChanged: (value) {
                  setState(() {
                    selectedSalon = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  fixedSize: const Size(116, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Buscar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class SearchFilterHorarios extends StatelessWidget {
//   const SearchFilterHorarios({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24.0),
//           color: const Color(0xFF3D3D3D),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x40000000),
//               offset: Offset(0.0, 4.0),
//               blurRadius: 4.0,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         height: 350,
//         width: 250,
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment:
//               MainAxisAlignment.spaceEvenly, // Ajustar el espacio verticalmente
//           children: <Widget>[
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 'Filtro de busqueda',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(
//                   5.0), // Ajusta el espacio entre el TextField y el Dropdown
//               child: _buildDropdownMenuDocenteACargo("Docente a cargo",
//                   const OutlineInputBorder(borderSide: BorderSide.none)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: _buildDropdownMenuGrupo(
//                   "Grupos", OutlineInputBorder(borderSide: BorderSide.none)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: _buildDropdownMenuSalon(
//                   "Grupos", OutlineInputBorder(borderSide: BorderSide.none)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   onPrimary: Colors.black,
//                   fixedSize: const Size(116, 40),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text('Buscar'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDropdownMenuDocenteACargo(String hintText, InputBorder border) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(26.0),
//         color: Colors.white,
//       ),
//       child: DropdownMenu<String>(
//         inputDecorationTheme: InputDecorationTheme(
//           border: InputBorder.none,
//         ),
//         initialSelection:
//             "Docente", // <-- Aquí es donde especificamos la opción que se seleccionará inicialmente
//         onSelected: (String? value) {
//           if (kDebugMode) {
//             print(value);
//           }
//         },
//         dropdownMenuEntries: <String>[
//           'Docente',
//           'Docente',
//           'Docente',
//           'Docente',
//           'Docente'
//         ].map((String value) {
//           return DropdownMenuEntry<String>(
//             value: value,
//             label: value,
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildDropdownMenuGrupo(String hintText, InputBorder border) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(26.0),
//         color: Colors.white,
//       ),
//       child: DropdownMenu<String>(
//         inputDecorationTheme: InputDecorationTheme(
//           border: InputBorder.none,
//         ),
//         initialSelection: "Grupo",
//         onSelected: (String? value) {
//           if (kDebugMode) {
//             print(value);
//           }
//         },
//         dropdownMenuEntries: <String>['3BM', '3BP', 'No se', 'No se', 'Grupo']
//             .map((String value) {
//           return DropdownMenuEntry<String>(
//             value: value,
//             label: value,
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildDropdownMenuSalon(String hintText, InputBorder border) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(26.0),
//         color: Colors.white,
//       ),
//       child: DropdownMenu<String>(
//         inputDecorationTheme: InputDecorationTheme(
//           border: InputBorder.none,
//         ),
//         initialSelection: "Salon",
//         onSelected: (String? value) {
//           if (kDebugMode) {
//             print(value);
//           }
//         },
//         dropdownMenuEntries:
//             <String>['100', '102', '103', '104', 'Salon'].map((String value) {
//           return DropdownMenuEntry<String>(
//             value: value,
//             label: value,
//           );
//         }).toList(),
//       ),
//     );
//   }

  // Widget _buildDropdownMenu(String hintText, InputBorder border) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(26.0),
  //       color: Colors.white,
  //     ),
  //     child: DropdownMenu<String>(
  //       initialSelection: 'Rol',
  //       onSelected: (String? value) {
  //         if (kDebugMode) {
  //           print(value);
  //         }
  //       },
  //       dropdownMenuEntries: <String>['A', 'B', 'Rol'].map((String value) {
  //         return DropdownMenuEntry<String>(
  //           value: value,
  //           label: value,
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }
//}
