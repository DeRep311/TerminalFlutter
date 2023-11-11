import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/src/DTOS/AuthDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';

class LoginService {
  final String baseUrl;

  LoginService({required this.baseUrl});

  Future<UsersModel> login(AuthDTO authDTO) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(authDTO.toJson()),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      return UsersModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server returns an unsuccessful response code, then throw an exception.
      throw Exception('Failed to login');
    }
  }
}






// class LoginService {
//   final String baseUrl;

//   LoginService({required this.baseUrl});

//   Future<bool> login(AuthDTO authDTO) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(authDTO.toJson()),
//     );

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, then parse the JSON.

//       return true;
//     } else {
//       // If the server returns an unsuccessful response code, then throw an exception.
//       throw Exception('Failed to login');
//     }
//   }
// }
