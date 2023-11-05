import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class CargarImagenes extends StatefulWidget {
  @override
  _CargarImagenesState createState() => _CargarImagenesState();
}

class _CargarImagenesState extends State<CargarImagenes> {
  bool imagenesCargadas = false;
  List<Image> imagenes = [];

  Future<void> cargarImagenes() async {
    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      for (final pickedFile in pickedFiles) {
        final imageBytes = await pickedFile.readAsBytes();
        final imageData = Uint8List.fromList(imageBytes.buffer.asUint8List());
        final image = Image.memory(imageData);
        imagenes.add(image);
      }

      setState(() {
        imagenesCargadas = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            cargarImagenes();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            fixedSize: const Size(140, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: const Text(
            'Subir plano',
          ),
        ),
      ],
    );
  }
}
