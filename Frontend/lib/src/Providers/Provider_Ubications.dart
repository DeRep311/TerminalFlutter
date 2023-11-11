import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/src/Models/CoordenadasModel.dart';
import 'package:my_app/src/DTOS/UbicacionDTO.dart';

class Provider_Ubications with ChangeNotifier {
  List<Offset> _points = [];
  //va hacer una peticion a la base de datos para traer las imagenes de los planos
  Map<String, String> options = {
    'Facultad': "lib/src/Assets/Icons/PlanoFacultad.jpg",
  };
  //va hacer una peticion a la base de datos para traer las ubicaciones que puede depender
  Map<String?, String?> ubications = {
    'Facultad': "lib/src/Assets/Icons/PlanoFacultad.jpg"
  };

  List<UbicationDTO> Ubicaciones = [];
  Map<Offset, XFile?> cooImages = {};
  double zoom = 1;
  bool _isDrawing = false;
  bool _isDeleting = false;
  String? _image;
  List<Offset> get points => _points;
  bool get isDrawing => _isDrawing;
  bool get isDeleting => _isDeleting;
  String? get image => _image;

  void addPoint(Offset point) {

    _points.add(point);
    cooImages.addAll({point: null});
    notifyListeners();
  }

  void deletePoint(Offset point) {
    _points.remove(point);
    cooImages.remove(point);

    notifyListeners();
  }

  void addImage(Offset point, XFile? image) {
    cooImages.update(point, (value) => image);
    var stream = image!.readAsBytes().asStream();
    notifyListeners();
  }

  void isDrawingChange() {
    _isDeleting = false;
    _isDrawing = !_isDrawing;

    notifyListeners();
  }

  void isDeletingChange() {
    _isDrawing = false;
    _isDeleting = !_isDeleting;

    notifyListeners();
  }

  void setImage(String image) {
    _image = image;
    notifyListeners();
  }

  void incrementzoom() {
    zoom += 0.1;
    notifyListeners();
  }

  void decrementzoom() {
    zoom -= 0.1;
    notifyListeners();
  }

  void saveData() {
    //aqui se guardan los datos en la base de datos haciendo una peticion post dandole el tipo de dato
    List<Coordenada> coo = [];
    for (var point in _points) {
     
    }

    //luego se vacia para ahorrar memoria
    disposeclean();
  }

  void disposeclean() {
    _points = [];
    cooImages = {};
    _isDrawing = false;
    _isDeleting = false;
    _image = null;
    notifyListeners();
  }
}
