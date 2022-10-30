import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class SlientBell with ChangeNotifier {
  bool _isStart = false;
  bool _isPause = true;
  bool _checkKeu = false;
  int _keu = 1;
  Duration _thoiGianChay = Duration();
  Duration _tongThoiGian = Duration();
  Timer? _timer;
  int _timeKeu = 1;

  int get timeKeu => _timeKeu;

  int get keu => _keu;

  bool get checkKeu => _checkKeu;

  void Runkeu() {
    _timeKeu = _keu;
    notifyListeners();
  }

  void timeK(int n) {
    _keu = n;
    notifyListeners();
  }

  void chageKeu(bool k) {
    _checkKeu = k;
    notifyListeners();
  }

  bool get isStart => _isStart;

  bool get isPause => _isPause;

  Duration get tongThoiGian => _tongThoiGian;

  set tongThoiGian(Duration value) {
    _tongThoiGian = value;
  }

  Duration get thoiGianChay => _thoiGianChay;

  set thoiGianChay(Duration value) {
    _thoiGianChay = value;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_thoiGianChay == Duration(seconds: 0)) {
          _isStart = false;
          if (_tongThoiGian.inSeconds % (_timeKeu * 60) == 0 &&
              _checkKeu == true) {
            _tongThoiGian = Duration(seconds: 0);
            final player = AudioCache();
            player.play('assets_note1.wav');
            timer.cancel();
            notifyListeners();
          } else {
            _tongThoiGian = Duration(seconds: 0);
            timer.cancel();
            notifyListeners();
          }
        } else {
          if (_checkKeu == true) {
            int t = _tongThoiGian.inSeconds;
            int h = _thoiGianChay.inSeconds;
            if ((t - h) % (_timeKeu * 60) == 0 && (t - h) > 0) {
              final player = AudioCache();
              player.play('assets_note1.wav');
              int k = _thoiGianChay.inSeconds.toInt() - 1;
              _thoiGianChay = Duration(seconds: k);
              print(_thoiGianChay);
              notifyListeners();
            } else {
              int k = _thoiGianChay.inSeconds.toInt() - 1;
              _thoiGianChay = Duration(seconds: k);
              print(_thoiGianChay);
              notifyListeners();
            }
          } else {
            int k = _thoiGianChay.inSeconds.toInt() - 1;
            _thoiGianChay = Duration(seconds: k);
            print(_thoiGianChay);
            notifyListeners();
          }
        }
      },
    );
  }

  void stop() {
    _timer!.cancel();
  }

  void open() {
    _isStart = false;
    notifyListeners();
  }

  void chage() {
    if (_isStart == true) {
      _isStart = false;
      notifyListeners();
    } else {
      _isStart = true;
      notifyListeners();
    }
  }

  void chageP() {
    if (_isPause == true) {
      _isPause = false;
      notifyListeners();
    } else {
      _isPause = true;
      notifyListeners();
    }
  }

  void Update() {
    _isPause = true;
    notifyListeners();
  }
}
