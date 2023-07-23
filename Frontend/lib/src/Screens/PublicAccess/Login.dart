// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/FormLogin.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: BackButton(
                  color: Colors.white,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Istok Web',
                        fontSize: 90,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'a',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Istok Web',
                        fontSize: 90,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'ITS',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'inika',
                        fontSize: 90,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 30),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  )
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //que ocupe todo el espacio disponible dentro del row
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 1,

                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(250)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(106, 255, 255, 255),
                            blurRadius: 25.0,
                            spreadRadius: 5,
                            offset: Offset(-12, -5)),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 50,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        LoginForm()
                      ]),
                ),
              )
            ]));
  }
}
