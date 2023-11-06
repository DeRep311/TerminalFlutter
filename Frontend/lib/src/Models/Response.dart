

// import 'package:flutter/material.dart';
// import 'package:my_app/src/Models/UsersDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// class Result {
//   late UserDTO? data;
//   late bool? success;
//   late String? message;

//   Result({required this.data, required this.success, required this.message});

//   factory Result.fromJson(Map<String, dynamic> datosDepeticion) {
//     UserDTO datos;
//     if (datosDepeticion['data'] == null || datosDepeticion['data'] == {}) {
//       datos = UserDTO(user: UsersModel.Vacio());
//     } else {
//       Map<String, dynamic> data = datosDepeticion['data'];
    

//       datos = UserDTO.fromMap(data);
//     }
//     if (datosDepeticion['message'] == null) {
//       datosDepeticion['message'] = "";
//     }
//     return Result(
//       data: datos,
//       success: datosDepeticion['success'],
//       message: datosDepeticion['message'],
//     );
//   }
// }
