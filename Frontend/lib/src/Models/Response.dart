class Result {
  final dynamic data;
  final bool success;
  final String message;

  Result({required this.data, required this.success, required this.message});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      data: json['data'],
      success: json['success'],
      message: json['message'],
    );
  }
}