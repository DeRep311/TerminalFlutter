class AuthDTO {
  final int cedula;
  final int pin;

  AuthDTO({required this.cedula, required this.pin});

  Map<String, dynamic> toJson() => {
        'cedula': cedula,
        'pin': pin,
      };
}
