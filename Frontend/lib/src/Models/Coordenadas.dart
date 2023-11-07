class Coordenada {
  int idC;
  double? cooX;
  double? cooY;
  String image;
  bool inicio;
  bool Cfinal;

  Coordenada({
    required this.idC,
    this.cooX,
    this.cooY,
    required this.image,
    required this.inicio,
    required this.Cfinal, 
  });

  factory Coordenada.fromJson(Map<String, dynamic> json) {
    return Coordenada(
      idC: json['IdC'],
      cooX: json['CooX'],
      cooY: json['CooY'],
      image: json['image'],
      inicio: json['Inicio'],
      Cfinal: json['Final'], 
      
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdC'] = this.idC;
    data['CooX'] = this.cooX;
    data['CooY'] = this.cooY;

    data['Inicio'] = this.inicio;
    data['Final'] = this.Cfinal;
    return data;
  }
}
