import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/AuthConnect.dart';
import 'Connect.dart'; // Importa el archivo Connect.dart

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String cedula = "";
  String pin = "";

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
              onPressed: () {
                iniciarSesion(context, cedula, pin,
                    _formKey); // Llama a la función iniciarSesion
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
