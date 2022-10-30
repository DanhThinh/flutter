import 'package:flutter/material.dart';

class checkStack with ChangeNotifier {
  bool _check = true;
  bool _hienThi = false;

  void ok() {
    _hienThi = true;
  }

  bool get hienThi => _hienThi;

  bool get check => _check;

  set check(bool value) {
    _check = value;
  }

  void change() {
    if (_check == true) {
      _check = false;
      notifyListeners();
    } else {
      _check = true;
      notifyListeners();
    }
  }

  void Update() {
    _check = true;
    notifyListeners();
  }
}
