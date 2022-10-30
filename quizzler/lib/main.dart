import 'package:flutter/material.dart';
import 'question_List.dart';

void main() => runApp(Quizzler());

qList qlist = qList();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int n = 0;
  List<Icon> checkquestion = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qlist.T[n].ques!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Check(
          clolur: Colors.green,
          text: 'True',
          onPress: () {
            qlist.T[n].answer == true
                ? checkquestion.add(Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  ))
                : checkquestion.add(Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ));
            setState(() {
              n < qlist.T.length-1 ? n++ : n = 0;
            });
          },
        ),
        Check(
          clolur: Colors.red,
          text: 'False',
          onPress: () {
            qlist.T[n].answer == false
                ? checkquestion.add(Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  ))
                : checkquestion.add(Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ));
            setState(() {
              n < qlist.T.length-1 ? n++ : n = 0;
            });
          },
        ),
        Row(
          children: checkquestion,
        )
      ],
    );
  }
}

class Check extends StatelessWidget {
  Check({this.clolur, this.text, required this.onPress});
  Color? clolur;
  String? text;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: clolur,
          child: Text(
            text!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
