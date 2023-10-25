import 'package:my_app/src/Models/UsersModel.dart';

class UsersDTO {
  late int cedula;
  late String nombre;
  late String Rol;

  UsersDTO({required UsersModel user}) {

    this.cedula = user.Cedula;
    
    this.nombre = '${user.Nombre} ${user.Apellido}';

    if (user.Administrador) {
      this.Rol = 'Administrador';
    } else if (user.Operador) {
      this.Rol = 'Operador';
    } else if (user.Docente) {
      this.Rol = 'Docente';
    } else if (user.Estudiante) {
      this.Rol = 'Estudiante';
    } else {
      this.Rol = 'Visitante';
    }

  



  }
}
