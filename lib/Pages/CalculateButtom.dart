import 'package:flutter/material.dart';
import '../Components/TextStyle.dart';

class CalculateButtom extends StatelessWidget {
  final Function onTap;
  final String titleButt;

  CalculateButtom({@required this.onTap, @required this.titleButt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        color: Color(0xffEA1556),
        child: Center(
          child: Text(
            titleButt,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
