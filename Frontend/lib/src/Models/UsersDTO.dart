import 'package:my_app/src/Models/UsersModel.dart';

class UsersDTO {
  late int cedula;
  late String nombre;
  late String Rol;

  UsersDTO(Map<String, dynamic> user) {

    cedula = user['Cedula'];
    nombre = user['Nombre'];
    if (user['Administrador'] == true) {
      Rol = 'Administrador';
    } else if (user['Operador'] == true) {
      Rol = 'Operador';
    } else if (user['Docente'] == true) {
      Rol = 'Docente';
    } else if (user['Estudiante'] == true) {
      Rol = 'Estudiante';
    } else {
      Rol = 'Visitante';
    }

  



  }
}
