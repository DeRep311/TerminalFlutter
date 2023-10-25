// Asegúrate de que esta línea esté al comienzo del archivo

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/src/Models/UsersDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Connect.dart';

Future<void> iniciarSesion(BuildContext context, String cedula, String pin,
    GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    try {
      // Obtener el objeto UsersModel a partir del JSON
      final resultado = await login(context, cedula, pin);
      final UsersModel usuario = UsersModel.fromJson(resultado);
      print('Respuesta del servidor: $resultado');
      // Mostrar toda la información del usuario
      print('Cedula: ${usuario.Cedula}');
      print('Nombre: ${usuario.Nombre}');
      print('Apellido: ${usuario.Apellido}');
      print('Telefono: ${usuario.Telefono}');
      print('Direccion: ${usuario.Direccion}');
      print('Administrador: ${usuario.Administrador}');
      print('Operador: ${usuario.Operador}');
      print('Docente: ${usuario.Docente}');
      print('Estudiante: ${usuario.Estudiante}');
      print("TEEEEEEEEEEEEEEEST");
      // if (usuario.Administrador == 'Administrador') {
      //   print("Bienvenido, eres un administrador.");
      // } else if (usuario.Docente) {
      //   print("Bienvenido, eres un docente.");
      // } else if (usuario.Estudiante) {
      //   print("Bienvenido, eres un estudiante.");
      // } else if (usuario.Operador == 'Operador') {
      //   print("Bienvenido, eres un operador.");
      // }

      // Resto del código
    } catch (error) {
      print('Error en el login: $error');
      // Manejo de errores
    }
  }
}
