import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  final Color color;
  final Widget card;
  final Function onPressed;
  MyCard({@required this.color, this.card, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15),
        child: card,
        ),
    );
  }
}
