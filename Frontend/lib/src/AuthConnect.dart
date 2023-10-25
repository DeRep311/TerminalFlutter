// Asegúrate de que esta línea esté al comienzo del archivo

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/src/Models/Response.dart';
import 'package:my_app/src/Models/UsersDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Connect.dart';

Future<void> iniciarSesion(BuildContext context, String cedula, String pin,
    GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    try {
      // Obtener el objeto UsersModel a partir del JSON
      Result resultado = await login(context, cedula, pin);
  
      if (resultado.success == true) {
        final UserDTO? usuario = resultado.data;
        // final UsersDTO usuarioDTO = UsersDTO(user: usuario);
        Navigator.pushNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(resultado.message ?? 'Error desconocido'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print('Error en el login: $error');
      // Manejo de errores
    }
  }
}
