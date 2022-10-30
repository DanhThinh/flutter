import 'package:flutter/material.dart';
import 'Reusablecard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'constants.dart';
enum gender{
  male,
  female,
}
class input_Page extends StatefulWidget {
  const input_Page({Key? key}) : super(key: key);

  @override
  State<input_Page> createState() => _input_PageState();
}

class _input_PageState extends State<input_Page> {
  gender colour = gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI CALCULATOR")),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    onPress: (){
                      setState(() {
                        colour = gender.male;
                      });
                    },
                    colour: colour == gender.male ? activeCardColour:inActiveCardColour,
                    childrenAction: iconContent(
                        icon: FontAwesomeIcons.mars, label: "MALE"),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    onPress: (){
                      setState(() {
                        colour = gender.female;
                      });
                    },
                      colour: colour == gender.female ? activeCardColour:inActiveCardColour,
                      childrenAction: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      )),
                ),
              ],
            )),
            Expanded(
              child:
            ),
            Expanded(
                child: 
                ),
                Expanded(
                  child: Reusablecard(
                    colour: activeCardColour,
                    childrenAction: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
              color: bottomContainerColur,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80,
            )
          ],
        ));
  }
}
