import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            audio(Colors.red,1),
            audio(Colors.yellow,2),
            audio(Colors.green,3),
            audio(Colors.lime,4),
            audio(Colors.brown,5),
            audio(Colors.blueAccent,6),
            audio(Colors.purple,7),
          ],
        )
      ),
    );
  }
}

Widget audio( Color cl , int number){
  return Expanded(child: FlatButton(
    color: cl,
    onPressed: () {
      final AudioCache player = AudioCache();
      player.play('note$number.wav');
    },
    child: Text('click me'),
  ));
}