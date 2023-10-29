import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Provider_Ubications with ChangeNotifier {
  List<Offset> _points = [];
  //va hacer una peticion a la base de datos para traer las imagenes de los planos
  Map<String, String> options = {
    'A': 'https://picsum.photos/id/1/200/300',
    'B': 'https://picsum.photos/id/2/200/300',
    'C': 'https://picsum.photos/id/3/200/300',
    'D': 'https://picsum.photos/id/4/200/300',
    'E': 'https://picsum.photos/id/5/200/300',
  };
  //va hacer una peticion a la base de datos para traer las ubicaciones que puede depender
  Map<String, String> ubications = {
    'A': 'https://picsum.photos/id/1/200/300',
    'B': 'https://picsum.photos/id/2/200/300',
    'C': 'https://picsum.photos/id/3/200/300',
    'D': 'https://picsum.photos/id/4/200/300',
    'E': 'https://picsum.photos/id/5/200/300',
  };
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
    print(_points);
    notifyListeners();
  }
  void addImage(Offset point, XFile? image) {
    cooImages.update(point, (value) => image);
    notifyListeners();
  }

  void isDrawingChange() {
    _isDeleting = false;
    _isDrawing = !_isDrawing;
    print(_isDrawing);
    notifyListeners();
  }

  void isDeletingChange() {
    _isDrawing = false;
    _isDeleting = !_isDeleting;
    print(_isDeleting);
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

  void saveData(){
    //aqui se guardan los datos en la base de datos haciendo una peticion post dandole el tipo de dato
  }
}
