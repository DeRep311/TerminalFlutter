import 'package:flutter/material.dart';

class Provider_Ubications with ChangeNotifier {
  List<Offset> _points = [];
  bool _isDrawing = false;
  bool _isDeleting = false;
  List<Offset> get points => _points;
  bool get isDrawing => _isDrawing;
  bool get isDeleting => _isDeleting;

  void addPoint(Offset point) {
    _points.add(point);
    notifyListeners();
  }

  void deletePoint(Offset point) {
    _points.remove(point);
    print(_points);
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
}
