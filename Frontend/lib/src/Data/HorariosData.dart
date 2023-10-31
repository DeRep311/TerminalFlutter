import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/src/Models/HorariosModel.dart';

Future<List<HorariosModel>> GetAll() async {
  final String url = 'http://localhost:5068/api/Horario/';

  // Realiza la solicitud GET
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseMap = await json.decode(response.body);
    List<HorariosModel> horarios = [];
    for (var h in responseMap['data']) {
      HorariosModel horario = HorariosModel.fromJson(h);
      horarios.add(horario);
    }
    return horarios;
  } else {
    return [];
  }
}
