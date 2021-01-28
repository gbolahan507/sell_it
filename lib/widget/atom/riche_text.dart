import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RicheTextfield extends StatelessWidget {
  const RicheTextfield({
    Key key, this.firsttext, this.secondtext, this.ontap, this.first_text_fonthWeight, this.second_text_fonthWeight,
  }) : super(key: key);

  final firsttext;
  final secondtext;
  final  ontap;
  final  first_text_fonthWeight;
  final  second_text_fonthWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$firsttext  ',
          style: TextStyle(
         color: Color(0xFF4D4D4D),
         fontSize:   16.0,
         fontWeight: first_text_fonthWeight ?? FontWeight.normal,
         fontFamily: 'OpenSans'
          ),
          children: <TextSpan> [
            TextSpan(
              text: '$secondtext',
          style: TextStyle(
         color: Color(0xFF2D6CDF),
         fontSize:   16.0,
         fontWeight: second_text_fonthWeight ??  FontWeight.bold,
         fontFamily: 'OpenSans'
          ),
          recognizer: TapGestureRecognizer() 
          ..onTap = ontap,
            )
          ]
         ),
         

    );
  }
}