import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  Reusablecard({required this.colour , required this.childrenAction, required this.onPress});
  final Color colour;
  final Widget childrenAction;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        child: childrenAction,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
