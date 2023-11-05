import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class CargarCedulas extends StatefulWidget {
  @override
  _CargarCedulasState createState() => _CargarCedulasState();
}

class _CargarCedulasState extends State<CargarCedulas> {
  bool excelCargado = false;
  List<String> cedulas = [];

  Future<void> cargarCedulas() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'], // Limitar a archivos Excel
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      final ByteData data =
          ByteData.sublistView(Uint8List.fromList(file.bytes!));
      final excel = Excel.decodeBytes(data.buffer.asUint8List());

      final sheet = excel.sheets['Hoja1'];

      // Usar el operador de acceso seguro para evitar el error
      sheet?.rows?.forEach((row) {
        String cedula = row[0].toString();
        if (cedula.length == 8) {
          cedulas.add(cedula);
        }
        print("Cédula cargada: $cedula"); // Imprimir la cédula en la consola
      });

      setState(() {
        excelCargado = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            cargarCedulas();
          },
          child: Text(excelCargado ? "Excel cargado" : "Cargar Excel",
              style:
                  TextStyle(color: excelCargado ? Colors.green : Colors.black)),
        ),
        if (excelCargado)
          Column(
            children: [
              Text("Cédulas cargadas:"),
              for (var cedula in cedulas) Text(cedula),
            ],
          ),
      ],
    );
  }
}
