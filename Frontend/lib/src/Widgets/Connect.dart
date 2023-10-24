// import 'package:http/http.dart' as http;

// var url = Uri.https('example.com', 'whatsit/create');
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

// print(await http.read(Uri.https('example.com', 'foobar.txt')));

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/src/AuthResponse+.dart';

Future<dynamic> login(BuildContext context,  cedula,  pin) async {
  final String url = 'http://localhost:5068/api/User/Auth';

  // Datos del JSON (cedula y pin)
  Map<String, dynamic> jsonData = {
    'Cedula': cedula,
    'Pin': pin,
  };

  // Realiza la solicitud POST
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(jsonData),
    );
    Map<String, dynamic> responseMap = await json.decode(response.body);

    AuthReponse authResponse = AuthReponse(responseMap);

    print(response.body);

    // Verifica la respuesta del servidor
    if (response.statusCode == 200) {
      // La solicitud se completó correctamente
      print('Login exitoso: ${response.statusCode}');

      return {'success': true, 'message': authResponse.message};

      // Aquí puedes realizar las acciones necesarias después del inicio de sesión exitoso
    } else {
      // Hubo un error en la solicitud
      print('Error en el login. Código de respuesta: ${response.statusCode})}');

      return {'success': false, 'message': authResponse.message};
    }
  } catch (e) {
    // Error en la conexión o en la respuesta del servidor
    print('Error: {$e}}');
    // Aquí puedes manejar el error de conexión o respuesta del servidor
  }
}
