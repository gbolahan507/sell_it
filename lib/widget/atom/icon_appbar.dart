import 'package:flutter/material.dart';


class Icon_AppBar extends StatelessWidget {
  const Icon_AppBar({ this.onpressed, this.icon, this.color
  
  });
  final onpressed;
  final  icon;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
           Align(alignment: Alignment.centerLeft,
                    
              child: InkWell(
              onTap: () => Navigator.pop(context),
                child: Icon(icon ??Icons.arrow_back_ios, size: 30.0, 
                 color: color ?? Colors.pink),
              ),
              
          
           )
      );
  }
}




class Double_Icon_AppBar extends StatelessWidget {
  const Double_Icon_AppBar({ this.icon, this.color, this.onTap
  
  });
  final  icon;
  final color;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
           Row(
             children: <Widget>[
               Align(alignment: Alignment.centerLeft,
                  child: InkWell(
                  onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, size: 30.0, 
                     color:  Colors.pink),
                  ),
               ),
               Spacer(),
                Align(alignment: Alignment.centerRight,
                  child: InkWell(
                  onTap: onTap,
                    child: Icon(icon ??Icons.arrow_back_ios, size: 30.0, 
                     color: color ?? Colors.pink),
                  ),
               ),
             ],
           )
      );
  }
}