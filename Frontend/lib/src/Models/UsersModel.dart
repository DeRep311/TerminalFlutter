class UsersModel {
  late int Cedula;
  late int pin;
  late String Nombre;
  late String Apellido;
  late int Telefono;
  late String Direccion;
  late bool Administrador;
  late bool Operador;
  late bool Docente;
  late bool Estudiante;
  late String? rol;

  UsersModel.fromJson(Map<String, dynamic> json) {
    Cedula = json['cedula'];
    pin = json['pin'];
    Nombre = json['nombre'];
    Apellido = json['apellido'];
    Telefono = json['telefono'];
    Direccion = json['direccion'];
    Administrador = json['administrador'];
    Operador = json['operador'];
    Docente = json['docente'] ?? false;
    Estudiante = json['estudiante'] ?? false;

    if (Administrador) {
      rol = 'Administrador';
    } else if (Operador) {
      rol = 'Operador';
    } else if (Docente) {
      rol = 'Docente';
    } else if (Estudiante) {
      rol = 'Estudiante';
    } else {
      rol = 'Visitante';
    }
  }



  UsersModel.Vacio() {
    Cedula = 0;
    pin = 0;
    Nombre = '';
    Apellido = '';
    Telefono = 0;
    Direccion = '';
    Administrador = false;
    Operador = false;
    Docente = false;
    Estudiante = false;
  }
}
