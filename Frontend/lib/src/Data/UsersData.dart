import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_app/src/Models/UsersModel.dart';

// Future<List<UsersModel>> GetAll() async {
//   final String url = 'http://localhost:5068/api/User/GetAll';

//   // Realiza la solicitud POST
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Map<String, dynamic> responseMap = await json.decode(response.body);
//     List<UsersModel> users = [];
//     for (var u in responseMap['data']) {
//       UsersModel user = UsersModel.fromJson(u);
//       users.add(user);
//     }
//     return users;
//   } else {
//     return [];
//   }
// }

Future<void> Update(int cedula, UsersModel usuarionuevo) async {
  final String url = 'http://localhost:5068/api/User/Update/$cedula';

  final response = await http.put(Uri.parse(url), body: usuarionuevo);
}

Future<void> Delete(int cedula) async {
  final String url = 'http://localhost:5068/api/User/Delete/$cedula';

  final response = await http.delete(Uri.parse(url));
}

// Future<void> Add(UsersModel usuarionuevo) async {
//   const String url = 'http://localhost:5068/api/User/Add/';

//   final response = await http.post(Uri.parse(url), body: usuarionuevo);
// }

Future<void> Add(UsersModel usuarionuevo) async {
  const String url = 'http://localhost:5068/api/User/Add/';

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(usuarionuevo.toJson()),
  );
}

Future<List<UsersModel>> GetAll() async {
  final String url = 'http://localhost:5068/api/User/GetAll';

  try {
    // Realiza la solicitud GET
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = await json.decode(response.body);
      List<UsersModel> users = [];
      for (var u in responseMap['data']) {
        UsersModel user = UsersModel.fromJson(u);
        users.add(user);
      }
      //print(users);
      return users;
    } else {
      print("Error: ${response.statusCode}");
      print("Response body: ${response.body}");
      return [];
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}








// // ignore_for_file: non_constant_identifier_names

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:my_app/src/Models/UsersModel.dart';


// Future<List<UsersModel>> GetAll() async {
//   final String url = 'http://localhost:5068/api/User/GetAll';

//   // Realiza la solicitud POST
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Map<String, dynamic> responseMap = await json.decode(response.body);
//     List<UsersModel> users = [];
//     for (var u in responseMap['data']) {
//       UsersModel user = UsersModel.fromJson(u);
//       users.add(user);
//     }
//     return users;
//   }else{

//     return [];

//   }
 
  
// }










// // ignore_for_file: non_constant_identifier_names

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:my_app/src/Models/UsersModel.dart';


// Future<List<UsersModel>> GetAll() async {
//   final String url = 'http://localhost:5068/api/User/GetAll';

//   // Realiza la solicitud POST
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Map<String, dynamic> responseMap = await json.decode(response.body);
//     List<UsersModel> users = [];
//     for (var u in responseMap['data']) {
//       UsersModel user = UsersModel.fromJson(u);
//       users.add(user);
//     }
//     return users;
//   }else{

//     return [];

//   }
 
  
// }
