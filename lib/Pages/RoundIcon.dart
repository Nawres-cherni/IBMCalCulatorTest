
import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {

  final IconData icons;
  final Function onPressed;

  const RoundIcon({@required this.icons, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
     
      
      child: Icon(icons),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xffeb1555),
    );
  }
}

