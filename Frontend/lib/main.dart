// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/src/Providers/Provider_Ubications.dart';
import 'package:my_app/src/Screens/Home.dart';
import 'package:my_app/src/Screens/Horarios.dart';
import 'package:my_app/src/Screens/OperadorOpciones.dart';
import 'package:my_app/src/Screens/PantallaPrincipal.dart';
import 'package:my_app/src/Screens/Operador.dart';
import 'package:my_app/src/Screens/Login.dart';
import 'package:my_app/src/Screens/LoginErrorScreen.dart';
import 'package:my_app/src/Screens/OperadorHorarios.dart';
import 'package:my_app/src/Screens/OperadorUbicacionesEdit.dart';
import 'package:my_app/src/Screens/OperadorMenuUbicaciones.dart';
import 'package:my_app/src/Screens/OperadorUsuarios.dart';
import 'package:my_app/src/Screens/Schedule.dart';
import 'package:my_app/src/Screens/Ubications.dart';
import 'package:provider/provider.dart';

import 'package:window_manager/window_manager.dart';

import 'src/Screens/OperadorCursos.dart';

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
  runApp(ChangeNotifierProvider(
      create: (_) => Provider_Ubications(), child: const MyApp()));

  windowsManager();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/schedule',
      routes: {
        '/': (context) => PantallaPrincipal(),
        '/home': (context) => Home(),
        // '/horarios': (context) => Horarios(),
        '/locations': (context) => Ubications(),
        '/schedule': (context) => Schedule(),
        '/loginError': (context) => LoginErrorScreen(),
        '/login': (context) => LoginScreen(),
        '/operador': (context) => OperadorScreen(),
        '/operador/opcionesAdministrativas': (context) =>
            OpcionesOperadorScreen(),
        '/operador/ubicaciones': (context) => OperadorUbicaciones(),
        '/operador/cursos': (context) => OperadorCursos(),
        '/operador/horarios': (context) => OperadorHorariosScreen(),
        '/operador/usuarios': (context) => OperadorUsuariosScreen(),
      },
    );
  }
}
