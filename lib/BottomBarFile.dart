import 'package:flutter/material.dart';
import 'constants.dart';
import 'answer.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.displayText, this.toDoOnTap});

  String displayText;
  Function toDoOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDoOnTap,
      child: Container(
        child: Center(
          child: Text(
            displayText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: kBottomContainerMargin),
      ),
    );
  }
}
