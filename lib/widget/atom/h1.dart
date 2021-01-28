import 'package:flutter/material.dart';

import '../../util/colors.dart';




class Apptext extends StatelessWidget {
  const Apptext({
    Key key, this.text, this.fontweight, this.fontsize, this.color, this.allignment, this.height, this.maxlines, this.overflow, this.softWrap,
  }) : super(key: key);

  final text;
  final fontweight;
  final color;
  final allignment;
  final double fontsize;
  final double height;
  final maxlines;
  final overflow;
  final softWrap;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: allignment ?? Alignment.centerLeft,
          child: Text('$text', style: TextStyle(
         color: color ?? teal200,
         fontSize: fontsize ??   16.0,
         fontWeight: fontweight ?? FontWeight.normal,
         fontFamily: 'Poppins',
         height: height,
      ),
      maxLines: maxlines,
      overflow: overflow,
      
      ),
    );
  }
}