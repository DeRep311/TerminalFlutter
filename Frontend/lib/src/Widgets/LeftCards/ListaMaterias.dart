// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Items.dart';

class CardListaMaterias extends StatelessWidget {
  final Widget children;
  const CardListaMaterias({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(100.0, 40.0, 0.0, 0.0),
        alignment: Alignment(0.0, -0.2),
        width: 340,
        height: 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(61, 61, 61, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0.0, 4.0),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        child: children);
  }
}

class ListaMaterias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },

      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },
      {
        "Nombre": "sociologia",
        "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
      },

      // Agrega más elementos según sea necesario
    ];

    return ListView.builder(
      itemCount: _items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Items(
          titulo: _items[index]["Nombre"],
          Imagen: _items[index]["Imagen"],
        );
      },
    );
  }
}

class MateriasConFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardListaMaterias(
        children: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListaMaterias(),
    ));
  }
}










// import 'package:flutter/material.dart';
// import 'package:my_app/src/Widgets/Items.dart';

// class ListaMaterias extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> _items = [
//       {"Nombre": "sociologia", "Imagen": 'lib/src/Assets/Icons/BanioIcon.png'},
//       {
//         "Nombre": "sociologia",
//         "Imagen": 'lib/src/Assets/Icons/AdscripIcon.png'
//       },
//       {
//         "Nombre": "sociologia",
//         "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
//       },
//       {
//         "Nombre": "sociologia",
//         "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
//       },

//       {
//         "Nombre": "sociologia",
//         "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
//       },
//       {
//         "Nombre": "sociologia",
//         "Imagen": 'lib/src/Assets/Icons/GorroGraduacion.png'
//       },

//       // Agrega más elementos según sea necesario
//     ];

//     return ListView.builder(
//       itemCount: _items.length,
//       scrollDirection: Axis.vertical,
//       itemBuilder: (BuildContext context, int index) {
//         return Items(
//           titulo: _items[index]["Nombre"],
//           Imagen: _items[index]["Imagen"],
//         );
//       },
//     );
//   }
// }
