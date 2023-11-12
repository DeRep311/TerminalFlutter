import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/AuthConnect.dart';
import 'package:my_app/src/DTOS/AuthDTO.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/login_service.dart';
import 'Connect.dart'; // Importa el archivo Connect.dart

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late String cedula;
  late String pin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                cedula = value!;
              },
              decoration: const InputDecoration(
                labelText: 'Cedula',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length != 8) {
                  return 'Ingrese una cédula válida (sin puntos ni guiones)';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const SizedBox(height: 55),
            SizedBox(
              width: 300,
              child: TextFormField(
                onSaved: (value) {
                  pin = value!;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Pin',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length != 4) {
                    return 'Ingrese un PIN válido (4 dígitos numéricos)';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(height: 55),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Create an instance of AuthService
                  AuthService authService = AuthService();
                  // Convert cedula and pin to int and call the login function
                  bool loginSuccess = await authService.login(
                      context, int.parse(cedula), int.parse(pin));
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.fromLTRB(100, 30, 100, 30),
              ),
              child: const Text(
                'Ingresar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();

//   late String cedula;
//   late String pin;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SizedBox(
//         width: 300,
//         child: Column(
//           children: [
//             TextFormField(
//               onSaved: (value) {
//                 cedula = value!;
//               },
//               decoration: const InputDecoration(
//                 labelText: 'Cedula',
//                 labelStyle: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty || value.length != 8) {
//                   return 'Ingrese una cédula válida (sin puntos ni guiones)';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//             const SizedBox(height: 55),
//             SizedBox(
//               width: 300,
//               child: TextFormField(
//                 onSaved: (value) {
//                   pin = value!;
//                 },
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Pin',
//                   labelStyle: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || value.length != 4) {
//                     return 'Ingrese un PIN válido (4 dígitos numéricos)';
//                   }
//                   return null;
//                 },
//                 keyboardType: TextInputType.number,
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//               ),
//             ),
//             const SizedBox(height: 55),
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                  //AQUI LLAMA A LA FUNCION DEL LOGIN
//                 }
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: const EdgeInsets.fromLTRB(100, 30, 100, 30),
//               ),
//               child: const Text(
//                 'Ingresar',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<void> iniciarSesion(
//     BuildContext context, String cedula, String pin) async {
//   final authDTO = AuthDTO(cedula: int.parse(cedula), pin: int.parse(pin));
//   final loginService = LoginService(
//       baseUrl:
//           'http://localhost:5068/api/User/Auth'); // Replace with your actual API URL
//   try {
//     final user = await loginService.login(authDTO);
//     // print(authDTO.toJson());
//     if (true) {
//       // Access the user's cedula
//       // print('User cedula: ${user?.cedula}');
//       // print('User pin: ${user?.pin}');

//       // print('User rol: ${user?.rol}');
//       print('User cedula: ${cedula}');
//       print('User pin: ${pin}');
//       // Navigate to the next screen
//       Navigator.pushReplacementNamed(context, '/operador');
//     } else {
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login failed. Please try again.')),
//       );
//     }
//   } catch (e) {
//     // Show an error message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('An error occurred: $e')),
//     );
//   }
// }




// Future<void> iniciarSesion(
//     BuildContext context, String cedula, String pin) async {
//   final authDTO = AuthDTO(cedula: int.parse(cedula), pin: int.parse(pin));
//   final loginService = LoginService(
//       baseUrl:
//           'http://localhost:5068/api/User/Auth'); // Replace with your actual API URL


//   try {
//     final success = await loginService.login(authDTO);

//     if (success) {
//       // Navigate to the next screen
//       // UsersModel user = await loginService.login(authDTO);
      
//       // Verifica el rol del usuario
//       // if (user.rol == 'RolEsperado') {}

//       Navigator.pushReplacementNamed(context, '/operador');
//     } else {
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login failed. Please try again.')),
//       );
//     }
//   } catch (e) {
//     // Show an error message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('An error occurred: $e')),
//     );
//   }
// }



















// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});
//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   late String email;
//   late String pin;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SizedBox(
//         width: 300,
//         child: Column(
//           children: [
//             TextFormField(
//               onSaved: (value) {
//                 email = value!;
//               },
//               decoration: InputDecoration(
//                 labelText: 'Cedula',
//                 labelStyle: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty || !(value.length == 8)) {
//                   return 'Ingrese su cedula sin . ni guiones';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//             SizedBox(
//               height: 55,
//             ),
//             SizedBox(
//               width: 300,
//               child: TextFormField(
//                 onSaved: (value) {
//                   pin = value!;
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Pin',
//                   labelStyle: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || !(value.length == 4)) {
//                     return 'Ingresa un pin de 4 digitos';
//                   }
//                   return null;
//                 },
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             SizedBox(
//               height: 55,
//             ),
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState?.save();
//                   if (email == '22222222' && pin == '2222') {
//                     Navigator.pushNamed(context, '/home');
//                   } else if (email == '11111111' && pin == '1111') {
//                     Navigator.pushNamed(context, '/operador');
//                   }
//                 }
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
//               ),
//               child: Text(
//                 'Ingresar',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:my_app/src/AuthConnect.dart';
// import 'package:my_app/src/Models/AuthDTO.dart';
// import 'package:my_app/src/login_service.dart'; // Replace with your actual path

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();

//   String cedula = "";
//   String pin = "";

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SizedBox(
//         width: 300,
//         child: Column(
//           children: [
//             TextFormField(
//               onSaved: (value) {
//                 cedula = value!;
//               },
//               decoration: const InputDecoration(
//                 labelText: 'Cedula',
//                 labelStyle: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty || value.length != 8) {
//                   return 'Ingrese una cédula válida (sin puntos ni guiones)';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//             const SizedBox(height: 55),
//             SizedBox(
//               width: 300,
//               child: TextFormField(
//                 onSaved: (value) {
//                   pin = value!;
//                 },
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Pin',
//                   labelStyle: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || value.length != 4) {
//                     return 'Ingrese un PIN válido (4 dígitos numéricos)';
//                   }
//                   return null;
//                 },
//                 keyboardType: TextInputType.number,
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//               ),
//             ),
//             const SizedBox(height: 55),
//             TextButton(
//               onPressed: () {
//                 // iniciarSesion(context, cedula, pin,
//                 //     _formKey); // Llama a la función iniciarSesion
//                 // login(context, cedula, pin);

//                 if (cedula == '0000000' && pin == '0000') {
//                   Navigator.pushNamed(context, '/home');
//                   return;
//                 } else if (cedula == '11111111' && pin == '1111') {
//                   Navigator.pushNamed(context, '/operador');
//                   return;
//                 }
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: const EdgeInsets.fromLTRB(100, 30, 100, 30),
//               ),
//               child: const Text(
//                 'Ingresar',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:my_app/src/AuthConnect.dart';
// import 'Connect.dart'; // Importa el archivo Connect.dart

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();

//   late String cedula;
//   late String pin;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SizedBox(
//         width: 300,
//         child: Column(
//           children: [
//             TextFormField(
//               onSaved: (value) {
//                 cedula = value!;
//               },
//               decoration: const InputDecoration(
//                 labelText: 'Cedula',
//                 labelStyle: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty || value.length != 8) {
//                   return 'Ingrese una cédula válida (sin puntos ni guiones)';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//             const SizedBox(height: 55),
//             SizedBox(
//               width: 300,
//               child: TextFormField(
//                 onSaved: (value) {
//                   pin = value!;
//                 },
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Pin',
//                   labelStyle: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || value.length != 4) {
//                     return 'Ingrese un PIN válido (4 dígitos numéricos)';
//                   }
//                   return null;
//                 },
//                 keyboardType: TextInputType.number,
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//               ),
//             ),
//             const SizedBox(height: 55),
//             TextButton(
//               onPressed: () {
//                 iniciarSesion(context, cedula, pin,
//                     _formKey); // Llama a la función iniciarSesion
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: const EdgeInsets.fromLTRB(100, 30, 100, 30),
//               ),
//               child: const Text(
//                 'Ingresar',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Inter',
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








