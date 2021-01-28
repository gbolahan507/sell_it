import 'package:flutter/material.dart';
import 'package:sell_its/util/colors.dart';

class ButtonFilled extends StatelessWidget {
  final text;
  final width;
  final action;
  final color;
  final Color textColor;

  ButtonFilled(
      {Key key, this.action, this.width, this.text, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: width ?? double.infinity,
      child: new FlatButton(
        onPressed: action,
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color ?? teal200,
          ),
          alignment: Alignment.center,
          child: Text(
            "$text",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor ?? whitecolor,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }
}
