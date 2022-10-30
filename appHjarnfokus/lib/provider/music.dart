import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hive/hive.dart';
import 'package:apphjarnfokus/widgets/history.dart';


class Music with ChangeNotifier {
  AudioPlayer _playMusic = AudioPlayer(playerId: 'my_unique_playerId');
  String _name = "";
  String _image = "";
  String _des = "";
  String _url = "";
  Duration _duration = new Duration();
  Duration _position = new Duration();
  bool _btnPlay = false;
  bool _btnhis = true;

  String get name => _name;

  String get image => _image;

  String get des => _des;

  String get url => _url;

  Duration get duration => _duration;

  Duration get position => _position;

  bool get btnPlay => _btnPlay;

  bool get btnhis => _btnhis;

  set btnhis(bool value) {
    _btnhis = value;
  }

  void Chage(String n, String i, String d, String u) {
    _name = n;
    _image = i;
    _des = d;
    _url = u;
    notifyListeners();
  }

  void Play() async {
    await _playMusic.play(url);
    notifyListeners();
  }

  void Stop() async {
    await _playMusic.stop();
    _btnPlay = false;
    notifyListeners();
  }

  void pause() async {
    await _playMusic.pause();
    _btnPlay = false;
    notifyListeners();
  }

  void setUrl() async {
    await _playMusic.setUrl(url);
    notifyListeners();
  }

  void seek(Duration k) async {
    await _playMusic.seek(k);
    notifyListeners();
  }

  void lisDura() {
    _playMusic.onDurationChanged.listen((event) {
      _duration = event;
      notifyListeners();
    });
  }

  void lisPosi() {
    _playMusic.onAudioPositionChanged.listen((event) {
      _position = event;
      notifyListeners();
    });
  }

  void lisCom(BuildContext context) {
    _playMusic.onPlayerCompletion.listen((event) {
      _position = Duration(seconds: 0);
      _btnPlay = false;
      if (_btnhis == true) {
        show(context);
      }
      notifyListeners();
    });
  }

  void updata() {
    _position = Duration(seconds: 0);
    notifyListeners();
  }

  void chagePlayMusic() {
    if (_btnPlay == true) {
      _btnPlay = false;
      notifyListeners();
    } else {
      _btnPlay = true;
    }
  }

  void show(BuildContext context) {
    TextEditingController feel = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Write your feeling here"),
            content: TextField(
              controller: feel,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  final k = History(
                      name: name,
                      time: DateTime.now().toString().split(".")[0],
                      feel: feel.text);
                  addHistory(k);
                  Navigator.pop(context);
                  notifyListeners();
                },
                elevation: 5.0,
                child: Text("save"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 5.0,
                child: Text("cancel"),
              )
            ],
          );
        });
  }

  void addHistory(History his) {
    final h = Hive.box('history');
    h.add(his);
  }
}
