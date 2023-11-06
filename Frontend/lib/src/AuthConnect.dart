// // Asegúrate de que esta línea esté al comienzo del archivo
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:my_app/src/Models/AuthDTO.dart';
// import 'package:my_app/src/Models/Response.dart';
// import 'package:my_app/src/Models/UsersDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';
// import 'package:my_app/src/login_service.dart';

// Future<void> iniciarSesion(BuildContext context, String cedula, String pin,
//     GlobalKey<FormState> formKey) async {
//   if (formKey.currentState!.validate()) {
//     formKey.currentState!.save();

//     if (cedula.isNotEmpty && pin.isNotEmpty) {
//       final authDTO = AuthDTO(cedula: int.parse(cedula), pin: int.parse(pin));
//       // rest of your code
//       final loginService = LoginService(
//           baseUrl:
//               'http://localhost:5068/api/User/Auth'); // Replace with your actual API URL

//       try {
//         final success = await loginService.login(authDTO);

//         if (success) {
//           // Navigate to the next screen
//           Navigator.pushReplacementNamed(context, '/home');
//         } else {
//           // Show an error message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Login failed. Please try again.')),
//           );
//         }
//       } catch (e) {
//         // Show an error message
//         print(authDTO.cedula);
//         print(authDTO.pin);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('An error occurred: $e')),
//         );
//       }
//     } else {
//       // Show an error message

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter both Cedula and Pin')),
//       );
//     }
//   }
// }


















// // Future<void> iniciarSesion(BuildContext context, String cedula, String pin,
// //     GlobalKey<FormState> formKey) async {
// //   if (formKey.currentState!.validate()) {
// //     formKey.currentState!.save();

// //     try {
// //       // Obtener el objeto UsersModel a partir del JSON
// //       Result resultado = await login(context, cedula, pin);

// //       if (resultado.success == true) {
// //         final UserDTO? usuario = resultado.data;
// //         // final UsersDTO usuarioDTO = UsersDTO(user: usuario);
// //         Navigator.pushNamed(context, '/home');
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text(resultado.message ?? 'Error desconocido'),
// //             backgroundColor: Colors.red,
// //           ),
// //         );
// //       }
// //     } catch (error) {
// //       print('Error en el login: $error');
// //       // Manejo de errores
// //     }
// //   }
// // }
