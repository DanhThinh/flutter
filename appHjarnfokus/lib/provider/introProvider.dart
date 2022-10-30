import 'package:flutter/material.dart';

class introProvier with ChangeNotifier {
  bool _check = true;

  bool get check => _check;

  void chage() {
    _check = false;
    notifyListeners();
  }

  void Update(){
    _check = true;
    notifyListeners();
  }
}
