import 'dart:convert';

class UsersModel {
  final int cedula;
  final String nombre;
  final String apellido;
  final int telefono;
  final int direccion;
  final int pin;
  final String rol;

  UsersModel({
    required this.cedula,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.direccion,
    required this.pin,
    required this.rol,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    return UsersModel(
      cedula: json['cedula'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      telefono: json['telefono'],
      direccion: json['direccion'],
      pin: json['pin'],
      rol: json['rol'],
    );
  }

  get selected => null;

  Map<String, dynamic> toJson() {
    return {
      'cedula': cedula,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'direccion': direccion,
      'pin': pin,
      'rol': rol,
    };
  }
}
