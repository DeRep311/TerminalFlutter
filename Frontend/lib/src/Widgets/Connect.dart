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
import 'package:my_app/src/Models/Response.dart';
import 'package:my_app/src/Models/UsersModel.dart';

Future<dynamic> login(BuildContext context, cedula, pin) async {
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

    // Decodifica la respuesta JSON
    Map<String, dynamic> responseMap = await json.decode(response.body);
    print('Response: $responseMap');

   Result authResponse = Result.fromJson(responseMap);

    // Verifica la respuesta del servidor

    final UsersModel usuario = authResponse.data;

    return authResponse;
    // Aquí puedes realizar las acciones necesarias después del inicio de sesión exitoso
  } catch (e) {
    // Error en la conexión o en la respuesta del servidor
    print('Error: {$e}}');
    // Aquí puedes manejar el error de conexión o respuesta del servidor
    print("TEEEEEEEEEEEEEEEST");
  }
}
