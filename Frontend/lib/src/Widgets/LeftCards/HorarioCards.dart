// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HorarioCard extends StatelessWidget {
  final String title;
  final String materia;
  final String horario;
  final String salon;
  final String? imagePathMateria;
  final String? imagePathSalon;
  final String? imagePathHorario;

  HorarioCard({
    required this.title,
    required this.materia,
    required this.horario,
    required this.salon,
    this.imagePathMateria,
    this.imagePathHorario,
    this.imagePathSalon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265, // Define la altura de la Card
      width: 250, // Define la anchura de la Card
      child: Card(
        color: Color.fromRGBO(61, 61, 61, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ]),
              SizedBox(height: 15.0),
              Padding(padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)),
              Row(
                children: <Widget>[
                  Image.asset(imagePathMateria!),
                  SizedBox(width: 10.0),
                  Text(materia,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 1))),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)),
              Row(
                children: <Widget>[
                  Image.asset(imagePathHorario!),
                  SizedBox(width: 10.0),
                  Text(horario,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 1))),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)),
              Row(
                children: <Widget>[
                  Image.asset(imagePathSalon!),
                  SizedBox(width: 10.0),
                  Text(salon,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 1))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















// import 'package:flutter/material.dart';

// class HorarioCard extends StatelessWidget {
//   final String title;
//   final String materia;
//   final String horario;
//   final String salon;

//   HorarioCard(
//       {required this.title,
//       required this.materia,
//       required this.horario,
//       required this.salon});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         color: Color.fromRGBO(61, 61, 61, 1),
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: <Widget>[
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromRGBO(255, 255, 255, 1)),
//             ),
//             SizedBox(height: 10.0),
//             Text('Materia: $materia'),
//             Text('Horario: $horario'),
//             Text('Salon: $salon'),
//           ],
//         ),
//       ),
//     );
//   }
// }
