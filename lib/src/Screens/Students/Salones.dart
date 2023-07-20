import 'dart:ui';

import 'package:flutter/material.dart';

class Salones extends StatefulWidget {
  const Salones({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DividedScreenState createState() => _DividedScreenState();
}

class _DividedScreenState extends State<Salones> {
  bool showInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Columna izquierda con fondo de pantalla y ajuste de tamaño
          Expanded(
            flex: 2, // Representa el 75% del ancho
            child: FractionallySizedBox(
              widthFactor: 1.0, // Representa el 75% del ancho
              alignment: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('lib/src/Assets/Icons/WallpaperLeaves.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '¡Busca tu salon!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              child: ClipRRect(
                // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.1),
                    child: const Text(
                      "CHOCOLATE",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Columna derecha
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showInput = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: showInput ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: showInput
                        ? const TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar salones',
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
