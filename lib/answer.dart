import 'package:bmi_calculator/BottomBarFile.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer({@required this.bmiValue, @required this.bmiText});

  final String bmiValue;
  final String bmiText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'RESULT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                bmiText.toUpperCase(),
                style: kAnswerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Text(
                bmiValue,
                style: kAnswerNumStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BottomBar(
            displayText: 'Recalculate BMI',
            toDoOnTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
