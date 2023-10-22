import 'package:flutter/material.dart';

import 'Widgets/Connect.dart';

Future<void> iniciarSesion(BuildContext context, String email, String pin, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    try {
      final resultado = await login(context, email, pin);

      if (resultado['success'] == true) {
        Navigator.pushNamed(context, '/operador');
      } else {
        Navigator.pushNamed(context, '/loginError');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(resultado['message']),
        ));
      }
    } catch (error) {
      print('Error en el login: $error');
      Navigator.pushNamed(context, '/loginError');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }
}








