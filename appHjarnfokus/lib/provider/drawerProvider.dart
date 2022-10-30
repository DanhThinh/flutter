import 'package:flutter/material.dart';

class drawerProvider with ChangeNotifier {
  int _k = 0;
  Color def = Colors.black;
  Color nauDef = Color(0xffFCE633);
  Color chage(int n) {
    if (k == n) {
      return nauDef;
    } else {
      return def;
    }
  }

  set k(int value) {
    _k = value;
  }

  int get k => _k;
}
