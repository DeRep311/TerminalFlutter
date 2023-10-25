import 'package:my_app/src/Models/UsersModel.dart';

class UserDTO {
  UsersModel? user;
  bool? isAdmin;
  bool? isOperator;
  bool? isDocente;
  bool? isEstudiante;

  UserDTO({
    required this.user,
    this.isAdmin = false,
    this.isOperator = false,
    this.isDocente = false,
    this.isEstudiante = false,
  });

  UserDTO.fromMap(Map<String, dynamic> map) {
    user = UsersModel.fromJson(map['user'] ?? {});
    isAdmin = map['IsAdmin'] ?? false;
    isOperator = map['IsOperator'] ?? false;
    isDocente = map['IsDocente'] ?? false;
    isEstudiante = map['IsEstudiante'] ?? false;
  }
}
