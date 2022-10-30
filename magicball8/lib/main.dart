import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int rd = 1;
  void action() {
    setState(() {
      rd = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Magic Ball 8',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: FlatButton(
                onPressed: () {
                  action();
                },
                child: Image.asset('images/ball$rd.png'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
