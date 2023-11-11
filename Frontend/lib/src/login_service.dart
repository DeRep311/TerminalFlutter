import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:my_app/src/Models/UsersModel.dart';
import 'dart:convert';

class AuthService {
  Future<bool> login(int cedula, int pin) async {
    // Fetch user data from the database using the cedula
    Map<String, dynamic>? userData =
        await fetchUserDataFromDatabase(cedula, pin);

    if (userData == null) {
      print('Failed to fetch user data.');
      return false;
    }
    print(userData);
    print('---------------------------------');

    // Create a UsersModel object from the fetched data
    UsersModel user = UsersModel.fromJson(userData);
    print('---------------------------------');
    if (userData == null) {
      print('Failed to fetch user data.');
      return false;
    }
    // Check if the input pin matches the user's pin
    if (user.pin == pin) {
      print('Login successful!');
      return true;
    } else {
      print('Invalid credentials.');
      print(user.cedula);
      return false;
    }
  }

  Future<Map<String, dynamic>> fetchUserDataFromDatabase(
      int cedula, int pin) async {
    try {
      // Define the request URL
      var url = Uri.parse('http://localhost:5068/api/User/Auth');

      // Send a POST request with the cedula as a parameter
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'cedula': cedula.toString(),
          'pin': pin.toString()
        }),
      );

      // print(jsonDecode(response.body));
      // If the request was successful
      if (response.statusCode == 200) {
        // Parse the response body as JSON and return it
        return jsonDecode(response.body);
      } else {
        // If the request failed, throw an error
        throw Exception(
            'Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }
}























// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:my_app/src/DTOS/AuthDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// class LoginService {
//   final String baseUrl;

//   LoginService({required this.baseUrl});

//   Future<UsersModel?> login(AuthDTO authDTO) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(authDTO.toJson()),
//     );

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final user = UsersModel.fromJson(data);
//       print('User data: ${user.toJson()}');
//       return user;
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }






















// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:my_app/src/DTOS/AuthDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:my_app/src/DTOS/AuthDTO.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// class LoginService {
//   final String baseUrl;

//   LoginService({required this.baseUrl});

//   Future<UsersModel?> login(AuthDTO authDTO) async {
      
   
//     final response = await http.post(
//       Uri.parse('$baseUrl'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(authDTO.toJson()),
//     );
//     Map<String, dynamic> responseMap = await json.decode(response.body);

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, then parse the JSON.
//       // return UsersModel.fromJson(jsonDecode(response.body));
//       print('Response: $responseMap');
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final user = UsersModel.fromJson(data);


//       print(data);

//       print(user.cedula);
//       //print();
//       return UsersModel.fromJson(data);
//     } else {
//       // If the server returns an unsuccessful response code, then throw an exception.
//       throw Exception('Failed to login');
//     }
//   }
// }

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
