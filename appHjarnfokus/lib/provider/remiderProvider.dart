import 'package:flutter/material.dart';

class remiderProvider with ChangeNotifier {
  bool _check = true;
  String _groupRadio = "30";
  String _value1 = "0";
  String _value2 = "0";

  String get groupRadio => _groupRadio;

  bool get check => _check;

  set check(bool value) {
    _check = value;
  }

  set groupRadio(String value) {
    _groupRadio = value;
  }

  void chage() {
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

  String get value1 => _value1;

  String get value2 => _value2;

  set value1(String value) {
    _value1 = value;
  }

  set value2(String value) {
    _value2 = value;
  }
}
