// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:my_app/src/Data/UsersData.dart';
// import 'package:my_app/src/Models/UsersDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';
// import 'package:my_app/src/Widgets/Items.dart';
// import 'package:my_app/src/Widgets/LeftCards/SearchFilterHorarios.dart';
// import 'package:my_app/src/Widgets/LeftCards/SearchFilterUsuarios.dart';

// import '../Widgets/Header/Header.dart';
// import '../Widgets/Layout.dart';

// class OperadorUsuariosScreen extends StatelessWidget {
//   const OperadorUsuariosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List<UsersDTO> users = [];
//     List<String> columns = ['Cedula', 'Nombre', 'Rol'];

//     var response = GetAll();

//     Future<dynamic> resp() async {
//       var response = await GetAll();

//       // for (var u in response) {
//       //   UsersDTO user = UsersDTO(user: u);
//       //   users.add(user);
//       // }
//     }

//     return Scaffold(
//         body: Container(
//             color: const Color.fromRGBO(255, 255, 255, 1),
//             child: Layout(
//                 children: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                   //Header main screen

//                   Header(nameOption: 'Visitante'),
//                   Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         BackButton(
//                           color: Colors.white,
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 Colors.transparent),
//                             overlayColor: MaterialStateProperty.all<Color>(
//                                 Colors.transparent),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               width: 790,
//                               height: 362,
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                 decoration: BoxDecoration(
//                                     color: const Color.fromARGB(
//                                         255, 255, 254, 254)),
//                                 child:
//                                     TableWidget(users: users, columns: columns),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SearchFilterUsuarios(),
//                       ])
//                 ]))));
//   }
// }

// class TableWidget extends StatelessWidget {
//   final List<UsersDTO> users;
//   final List columns;

//   TableWidget({required this.users, required this.columns});

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: <DataColumn>[
//         for (var c in columns) DataColumn(label: Text(c)),
//       ],
//       rows: [
//         for (var u in users)
//           DataRow(cells: [
//             DataCell(Text(u.cedula.toString())),
//             DataCell(Text(u.nombre)),
//             DataCell(Text(u.Rol)),
//           ])
//       ],
//     );
//   }
// }
