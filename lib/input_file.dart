import 'package:bmi_calculator/Calculations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderWidget.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import 'answer.dart';
import 'BottomBarFile.dart';
import 'RoundIconButton.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Gender currentGender;
  int height = 100;
  int weight = 25;
  int age = 10;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        currentGender = Gender.male;
                      });
                    },
                    colorVal: currentGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderWidget(
                      currentIcon: FontAwesomeIcons.mars,
                      textInside: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        currentGender = Gender.female;
                      });
                    },
                    colorVal: currentGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderWidget(
                      currentIcon: FontAwesomeIcons.venus,
                      textInside: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colorVal: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0X29003CAE),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                        disabledThumbRadius: 10,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50,
                      max: 260,
                      activeColor: kBottomContainerColor,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colorVal: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                if (weight > 1) weight--;
                              });
                            }),
                            SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                if (weight < 500) weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorVal: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                if (age > 0) age--;
                              });
                            }),
                            SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                if (age < 150) age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
              displayText: "Calculate BMI",
              toDoOnTap: () {
                Calculations brain =
                    Calculations(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Answer(
                      bmiValue: brain.bmiValue(), bmiText: brain.bmiText());
                }));
              }),
        ],
      ),
    );
  }
}
