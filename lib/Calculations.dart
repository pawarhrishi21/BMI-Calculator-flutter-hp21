import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculations {
  Calculations({@required this.height, @required this.weight});

  int height;
  int weight;
  double _bmi;
  String bmiValue() {
    double value = (this.weight) / pow(this.height / 100, 2);
    _bmi = value;
    return value.toStringAsFixed(1);
  }

  String bmiText() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi <= 18.5)
      return 'Underweight';
    else
      return 'Normal';
  }
}
