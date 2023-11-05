import 'package:flutter/material.dart';
import 'package:my_app/src/Models/UsersModel.dart';
import 'package:my_app/src/Widgets/Layout.dart';

import '../Widgets/Header/header.dart';
import '../Widgets/LeftCards/SearchFilterUsuarios.dart';
import 'OperadorUsuarios.dart';

class CursosAdministrador extends StatelessWidget {
  const CursosAdministrador({super.key});

  @override
  Widget build(BuildContext context) {
    List<UsersModel> users = [];
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Layout(
          children: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Header(nameOption: 'Visitante'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BackButton(
                    color: Colors.white,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 790,
                        height: 362,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 254, 254)),
                          // child: UsersDataTable(users: users),
                          //TableWidget(users: users, columns: columns),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Agregar'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text('Borrar'),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ],
                  ),
                  SearchFilterUsuarios(),
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
