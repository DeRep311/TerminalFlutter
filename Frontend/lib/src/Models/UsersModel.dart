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
    return UsersModel(
      cedula: json['Cedula'],
      nombre: json['Nombre'],
      apellido: json['Apellido'],
      telefono: json['Telefono'],
      direccion: json['Direccion'],
      pin: json['Pin'],
      rol: json['Rol'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Cedula': cedula,
      'Nombre': nombre,
      'Apellido': apellido,
      'Telefono': telefono,
      'Direccion': direccion,
      'Pin': pin,
      'Rol': rol,
    };
  }
}
