import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:apphjarnfokus/widgets/drawer.dart';

class SU extends StatefulWidget {
  SU({this.n});
  String? n;

  @override
  State<SU> createState() => _SUState();
}

class _SUState extends State<SU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3eafc1),
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color(0xff3eafc1),
      ),
      endDrawer: DrawerOnly(number: 2),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Image.asset(
                  "images/logo_purchase.png",
                  height: 180,
                  width: 200,
                ),
              ),
            ),
            Text("Aktiv prenumeration",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: "medium")),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tack for din prenumeration",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  Text(
                    "Du har valt att betala: Manadsvis",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  Text(
                    "Fornyas: 6 aug 2021",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  )
                ],
              ),
            ),
            Text(
              "Vill du byta till arlig betalning?",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: 200,
                child: Center(
                    child: Text(
                  widget.n!,
                  style: TextStyle(color: Color(0xff3eafc1)),
                )),
              ),
            ),
            Text(
              "Vill du avbryta prenumerationen?",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: 200,
                child: Center(
                    child: Text(
                  "Avbryt",
                  style: TextStyle(color: Color(0xff3eafc1)),
                )),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "De första 30 dagarna provar du kostnadsfritt. Därefter förnyas prenumerationen automatiskt om den inte avbryts senast 24 timmar innan en pågående period löper ut (månad eller år). Här kan du läsa mer om hur du ",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                    TextSpan(
                      text: "avbryta prenumerationen",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => TP()));
                        },
                    )
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
