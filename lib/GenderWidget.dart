import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({this.currentIcon, this.textInside});

  final IconData currentIcon;
  final String textInside;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          currentIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textInside,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
