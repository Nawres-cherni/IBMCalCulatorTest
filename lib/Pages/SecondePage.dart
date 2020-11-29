
import 'package:flutter/material.dart';
import 'CalculateButtom.dart';
import 'FirstPage.dart';
import 'MyCard.dart';
import '../Components/TextStyle.dart';
import 'package:get_storage/get_storage.dart';

class SecondePage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const SecondePage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Flutter calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: tittleStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              color: activeColor,
              card: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: weightColor[resultText],
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: bMIStyle,
                  ),
                  Text(
                    interpretation,
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CalculateButtom(
            titleButt: 'RE-CALCULATE',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
