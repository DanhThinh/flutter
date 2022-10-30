import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Dice(),
      ),
    );
  }
}
class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int L = 3;
  int R = 2;
  void action(){
    setState(() {
      L = Random().nextInt(6) + 1;
      R = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    onPressed: () {
                      action();
                    },
                    child: Image.asset('images/dice$L.png'),
                  ))),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                    onPressed: () {
                      action();
                    },
                    child: Image.asset('images/dice$R.png')),
              )),
        ],
      ),
    );
  }
}
