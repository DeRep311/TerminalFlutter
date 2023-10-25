import 'package:my_app/src/Models/UsersModel.dart';

class Result {
  late UsersModel data;
  late bool? success;
  late String? message;

  Result({required this.data, required this.success, required this.message});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      data: json['data'] ?? UsersModel.Vacio(),
      success: json['success'],
      message: json['message'],
    );
  }
}