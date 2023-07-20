import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

@override
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = "";
    String pin = "";
    return Form(
        key: _formKey,
        child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Cedula',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !(value.length == 8)) {
                        return 'Ingrese su cedula sin . ni guiones';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                const SizedBox(
                  height: 55,
                ),
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
                            fontWeight: FontWeight.normal),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty || !(value.length == 4)) {
                        return 'Ingresa un pin de 4 digitos';
                      }

                      return null;
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        
                        // Revisa si el email y el pin son '11111111' y '1111' respectivamente
                        if (email == '11111111' && pin == '1111') {
                          // Navega a la página '/HomeDocentes'
                          Navigator.pushNamed(context, '/HomeDocentes');
                        } else {
                          // Navega a la página '/HomeEstudiante'
                          Navigator.pushNamed(context, '/HomeEstudiante');
                        }
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
                          fontWeight: FontWeight.normal),
                    ))
              ],
            )));
  }
}
