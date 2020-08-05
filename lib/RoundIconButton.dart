import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton(this.displayIcon, this.buttonPressed);
  final IconData displayIcon;
  final Function buttonPressed;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        buttonPressed();
      },
      child: Icon(displayIcon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
