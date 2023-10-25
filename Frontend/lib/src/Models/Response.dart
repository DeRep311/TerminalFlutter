import 'package:my_app/src/Models/UsersModel.dart';

class Result {
  late UsersModel data;
  late bool? success;
  late String? message;

  Result({required this.data, required this.success, required this.message});

  factory Result.fromJson(Map<String, dynamic> json) {
    UsersModel datos;
    if (json['data'] == null|| json['data'] == {}) {
      datos = UsersModel.Vacio();
    } else {
      datos = UsersModel.fromJson(json['data']);
    }
    if (json['message'] == null) {
      json['message'] = "";
    }
    return Result(
      data: datos,
      success: json['success'],
      message: json['message'],
    );
  }
}
