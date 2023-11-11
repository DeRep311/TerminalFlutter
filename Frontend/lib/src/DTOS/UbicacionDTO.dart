import 'package:my_app/src/Models/CoordenadasModel.dart';

// ignore: prefer_typing_uninitialized_variables
 class UbicationDTO {
  String codigoUbicaciones;
  String nombre;
  bool publico;
  bool privado;
  List<Coordenada> idCs;
  String codigoP;
  String planoImg;

  UbicationDTO({
    required this.codigoUbicaciones,
    required this.nombre,
    required this.publico,
    required this.privado,
    required this.idCs,
    required this.codigoP,
    required this.planoImg,
  });

  // Agrega el método toJson para convertir la clase en JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoUbicaciones'] = this.codigoUbicaciones;
    data['nombre'] = this.nombre;
    data['publico'] = this.publico;
    data['privado'] = this.privado;
    data['idCs'] = this.idCs.map((e) => e.toJson()).toList();
    data['codigoP'] = this.codigoP;
    data['planoImg'] = this.planoImg;
    return data;
  }
}
