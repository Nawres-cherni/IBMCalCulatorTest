import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iconn extends StatelessWidget {
  const Iconn({@required this.icon,this.text});
   final IconData icon;
  final String text;
  @override
Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
    children: <Widget>[
      Icon(
       icon,
        color:Colors.white,
        size:80,
      
      ),
      SizedBox(
        height:15
      ),
      Text(
        text,
        style:TextStyle(
          fontSize: 18,
          color: Color(0xFF8D8E98),
        )
      )
    ]

    );
  }
}
