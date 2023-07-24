// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import 'package:my_app/src/Screens/PublicAccess/Login.dart';
import 'package:my_app/src/Screens/PublicAccess/LoginErrorScreen.dart';
import 'package:window_manager/window_manager.dart';

import 'src/Screens/PublicAccess/Home.dart';
import 'src/Screens/PublicAccess/GuestsLocations.dart';
import 'src/Screens/Students/HomeEstudiante.dart';
import 'src/Screens/Students/Locations.dart';
import 'src/Screens/StudentsTeacher/FUD.dart';
import 'src/Screens/StudentsTeacher/Salones.dart';
import 'src/Screens/Students/HorariosEstudiantes.dart';
import 'src/Screens/Teacher/HomeDocentes.dart';
import 'src/Screens/Teacher/HorariosDocentes.dart';
import 'src/Screens/Teacher/LocationsDocentes.dart';



void windowsManager() async {
  WidgetsFlutterBinding.ensureInitialized();
// Initialize the WindowManager instance.
  await windowManager.ensureInitialized();
// Create a window.
  WindowOptions windowOptions = WindowOptions(
    size: Size(1280, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.values[0],
  );
  // Show the window.
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

void main() async {
  runApp(const MyApp());
 
  windowsManager();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/GuestLocations': (context) => GuestLocation(), 
        '/HomeEstudiante': (context)=> HomeEstudiante(),
        '/LocationsEstudiantes': (context)=> Locations(),
        '/HorariosEstudiantes': (context)=> HorariosEstudiantes(),   
        '/Salones': (context)=> Salones(),   
        
        '/HomeDocentes': (context)=> HomeDocentes(),
        '/HorariosDocentes': (context)=> HorariosDocentes(),
        '/LocationsDocentes': (context)=> LocationsDocentes(),


        '/FUD': (context)=> FUD(), //Function Under Development

        
        '/loginError': (context)=> LoginErrorScreen(),
        '/login': (context)=> LoginScreen(),
      
        },
    );
  }
}


