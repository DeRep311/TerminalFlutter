class AuthReponse {
  dynamic data;
  bool? success;
  String? message;

  AuthReponse(Map<String, dynamic> data) {
    this.data = data.containsKey('data') ? data['data'] : null;
    this.success = data.containsKey('success') ? data['success'] : null;
    this.message = data.containsKey('message') ? data['message'] : null;
  }
}
