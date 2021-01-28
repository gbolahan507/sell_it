import 'package:flutter/material.dart';
import '../../util/colors.dart';
import 'h1.dart';




class Heading_text extends StatelessWidget {
  const Heading_text({
    Key key, this.text,
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Apptext(
        allignment: Alignment.centerLeft,
        text: '${text}',
        color: thickblack,
        fontsize: 30,
        fontweight: FontWeight.bold,
      );
  }
}