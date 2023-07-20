import 'package:flutter/material.dart';

import '../../Widgets/Layout.dart';
import '../../Widgets/Box.dart';
import '../../Widgets/Header/Header.dart';

class HorariosEstudiantes extends StatelessWidget {
  const HorariosEstudiantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Layout(
          children: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Cajas en la parte superior
              
              
              // Header main screen
              const Header(
                nameOption: 'Logued',
              ),
              
              
              // Flecha para volver atrás
              Row(
                children: [
                  SizedBox(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 32, // Ajusta el tamaño del ícono aquí
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30), // Espacio entre las cajas

              
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 30), // Espacio entre las cajas

                  
                  
                  SizedBox(
                    width: 120, // Ancho de la primera caja
                    child: Box(
                      text: 'Salon',
                    ),
                  ),
                  SizedBox(width: 2), // Espacio entre las cajas
                  SizedBox(
                    width: 120, // Ancho de la segunda caja
                    child: Box(
                      text: 'Hora',
                    ),
                  ),
                
                  SizedBox(width: 2), // Espacio entre las cajas
                  SizedBox(
                    width: 180, // Ancho de la segunda caja
                    child: Box(
                      text: 'Docente',
                    ),
                  ),
                
                  SizedBox(width: 50), // Espacio entre las cajas
                  SizedBox(
                    width: 180, // Ancho de la segunda caja
                    child: Box(
                      text: 'Materia',
                    ),
                  ),




                ],
              ),

              const Center(
                
                      child: Text(
                        "Function under development",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                    ),

              
            ],
          ),
        ),
      ),
    );
  }
}
