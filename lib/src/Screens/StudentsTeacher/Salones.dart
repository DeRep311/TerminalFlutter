import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart'; // Importar el paquete para el inputFormatters

class Salones extends StatefulWidget {
  const Salones({Key? key}) : super(key: key);

  @override
  _DividedScreenState createState() => _DividedScreenState();
}

class _DividedScreenState extends State<Salones> {
  bool showInput = true;
  final TextEditingController _searchController = TextEditingController();
  double _inputPositionY = 0.0;
  final double _animationDistance = 270.0;
  final FocusNode _focusNode = FocusNode();

  bool _isValidSalon = true;

  bool _isNumberInRange(String input) {
    int number = int.tryParse(input) ?? 0;
    return (number >= 100 && number <= 110) || (number >= 200 && number <= 210);
  }

  void _validateSalon(String input) {
    setState(() {
      _isValidSalon = _isNumberInRange(input);
    });
  }

  void _animateInputUp() {
    setState(() {
      _inputPositionY = -(_animationDistance + _getKeyboardHeight());
    });
  }

  void _animateInputDown() {
    setState(() {
      _inputPositionY = 0.0;
    });
  }

  double _getKeyboardHeight() {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.viewInsets.bottom;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animateInputUp();
      } else {
        _animateInputDown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(242, 236, 230, 230),
      body: Stack(
        children: [
          // Fondo de la pantalla dividida
          Row(
            children: [
              // Parte izquierda con la imagen y el efecto de blur
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/src/Assets/Icons/WallpaperLeaves.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Busca un salon",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Parte derecha con el input centrado y elevado
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    _animateInputUp();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(0, _inputPositionY, 0),
                    child: Center(
                      child: Container(
                        width: 250, // Ancho del input
                        height: 50, // Alto del input
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5), // Radio del borde
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 0,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              focusNode: _focusNode,
                              onTap: () {
                                _animateInputUp();
                              },
                              onSubmitted: (_) {
                                _focusNode.unfocus();
                              },
                              controller: _searchController,
                              onChanged: _validateSalon, // Call the validation function
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                // Permite solo dígitos
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ingrese un salon a buscar...",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                errorText: _isValidSalon ? null : "Numero de salon inexistente",
                                // Show error message when _isValidSalon is false
                                errorStyle: const TextStyle(color: Colors.red),
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              keyboardType: TextInputType.number, // Show numeric keyboard
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),



          const Positioned(
                bottom: 20,
                left: 450,
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
          // Flecha para volver atrás
          Positioned(
            top: 20, // Espacio desde la parte superior
            left: 20, // Espacio desde el borde izquierdo
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop(); // Navegar hacia atrás al presionar la flecha
              },
            ),
          ),
        ],
      ),
    );
  }
}
