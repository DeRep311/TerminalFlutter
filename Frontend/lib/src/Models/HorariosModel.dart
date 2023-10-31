class HorariosModel {
  final int? idH;
  final String grupo;
  final String docente;
  final String materia;
  final String horaInicio;
  final String horaFin;
  final String nombreDia;
  final String salon;
  bool selected;

  HorariosModel({
    this.idH,
    required this.grupo,
    required this.docente,
    required this.materia,
    required this.horaInicio,
    required this.horaFin,
    required this.nombreDia,
    required this.salon,
    this.selected = false,
  });

  @override
  List<Object?> get props => [
        idH,
        grupo,
        docente,
        materia,
        horaInicio,
        horaFin,
        nombreDia,
        salon,
        selected
      ];

  factory HorariosModel.fromJson(Map<String, dynamic> json) {
    return HorariosModel(
      idH: json['idH'],
      grupo: json['grupo'],
      docente: json['docente'],
      materia: json['materia'],
      horaInicio: json['horaInicio'],
      horaFin: json['horaFin'],
      nombreDia: json['nombreDia'],
      salon: json['salon'],
      selected: json['selected'] ?? false,
    );
  }
}
