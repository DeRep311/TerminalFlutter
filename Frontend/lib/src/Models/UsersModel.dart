 class UsersModel {
  late int Cedula;
  late String Nombre;
  late String Apellido;
  late String Telefono;
  late String Direccion;
  late bool Administrador;
  late bool Operador;
  late bool Docente;
  late bool Estudiante;

  UsersModel(
      {required this.Cedula,
      required this.Nombre,
      required this.Apellido,
      required this.Telefono,
      required this.Direccion,
      required this.Administrador,
      required this.Operador,
      required this.Docente,
      required this.Estudiante});

  UsersModel.fromJson(Map<String, dynamic> json) {
    Cedula = json['Cedula'];
    Nombre = json['Nombre'];
    Apellido = json['Apellido'];
    Telefono = json['Telefono'];
    Direccion = json['Direccion'];
    Administrador = json['Administrador'];
    Operador = json['Operador'];
    Docente = json['Docente'];
    Estudiante = json['Estudiante'];
  }

  


}
