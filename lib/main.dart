// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import 'package:my_app/src/Screens/PublicAcces/Login.dart';
import 'package:window_manager/window_manager.dart';

import 'src/Screens/PublicAcces/FirstScreen.dart';
import 'src/Screens/Students/StudentOptions.dart';

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
        '/': (context) => FirstScreen(),
        '/HomeEstudiante': (context) =>  StudentOptions(),
        '/login': (context)=> LoginScreen(),
      
        },
    );
  }
}


