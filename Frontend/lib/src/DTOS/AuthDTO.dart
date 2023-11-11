class AuthDTO {
  final int cedula;
  final int pin;

  AuthDTO({required this.cedula, required this.pin});

  Map<String, dynamic> toJson() => {
        'Cedula': cedula,
        'Pin': pin,
      };
}
