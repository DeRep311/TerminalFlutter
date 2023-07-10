// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/src/Widgets/Cards.dart';
import 'package:my_app/src/Widgets/GridNavigation.dart';
import 'package:my_app/src/Widgets/Layout.dart';
import 'package:my_app/src/Widgets/OptionBox.dart';
import 'package:my_app/src/Widgets/header.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
// Initialize the WindowManager instance.
  await windowManager.ensureInitialized();
// Create a window.
  WindowOptions windowOptions = WindowOptions(
    size: Size(1280, 832),
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Layout(
              children: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  //Header main screen
                  Header(),
                  //Container for grid and weather
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //options grid
                      GridNavigation(childrens: [
                        OptionBox(
                            title: 'opcion 1',
                            imagePath:
                                'lib/src/Assets/Icons/graduation-hat-02.png'),
                        OptionBox(
                            title: 'opcion',
                            imagePath:
                                'lib/src/Assets/Icons/graduation-hat-02.png'),
                        OptionBox(
                            title: 'opcion 2',
                            imagePath:
                                'lib/src/Assets/Icons/graduation-hat-02.png'),
                        OptionBox(
                            title: 'opcion',
                            imagePath:
                                'lib/src/Assets/Icons/graduation-hat-02.png'),
                      ]),
                      //wheather and time
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CardTime(), CardTime()],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
        );
  }
}
