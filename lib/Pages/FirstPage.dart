import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MyCard.dart';
import 'RoundIcon.dart';
import 'CalculateButtom.dart';
import 'Calculate.dart';
import '../Components/Icon.dart';
import '../Components/TextStyle.dart';

import 'package:get_storage/get_storage.dart';

import 'SecondePage.dart';
const activeColor = Color(0xff1D1F33);
const inactiveColor = Color(0xff111328);
enum Gender { male, female }


class FirstPage extends StatefulWidget {
  FirstPage() : super();

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Gender selectiondGender;
  int height = 180, weight = 60, age = 50;
  
  GetStorage box=GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write("name", "test name");
    print(box.read('name'));
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Flutter calculator'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
            Widget>[
               Expanded(
              child: MyCard(
                  color: activeColor,
                  card: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         
                       TextField(     
                          textAlign: TextAlign.center,            
                         decoration: InputDecoration(                         
                          border: InputBorder.none,
                          hintText: 'Enter your name',     
                                                  
                            ),
                              ), 
                            RaisedButton(
                              color: Colors.pink,
                              child:Text("Validate"),
                              onPressed: (){
                                box.write("name", "test name");
                               // Get.to(SecondePage(), arguments:"this agument");

                              }
                            )
                       ]
                       )
                      )
                      ),
          Expanded(            
              child: Row(children: <Widget>[
            Expanded(
              child: MyCard(
                color: (selectiondGender == Gender.male)
                    ? activeColor
                    : inactiveColor,
                onPressed: () {
                  setState(() {
                    selectiondGender = Gender.male;
                  });
                },
                card: Iconn(
                  icon: FontAwesomeIcons.mars,
                  text: 'Male',
                ),
              ),
            ),
            Expanded(
              child: MyCard(
                color: (selectiondGender == Gender.female)
                    ? activeColor
                    : inactiveColor,
                onPressed: () {
                  setState(() {
                    selectiondGender = Gender.female;
                  });
                },
                card: Iconn(
                  icon: FontAwesomeIcons.venus,
                  text: 'Female',
                ),
              ),
            ),
          ])),
          Expanded(
              child: MyCard(
                  color: activeColor,
                  card: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: textPetit,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: numberStyle,
                            ),
                            Text(
                              'cm',
                              style: textPetit,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 10),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xff8d8e98),
                              thumbColor: Color(0xffeb1555),
                              overlayColor: Color(0x29eb1555)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 150,
                            max: 300,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ]))),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: MyCard(
                color: activeColor,
                card: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: textPetit,
                    ),
                    Text(
                      '$weight',
                      style: numberStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RoundIcon(
                              icons: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              }),
                          RoundIcon(
                            icons: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Expanded(
                child: MyCard(
                    color: activeColor,
                    card: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: textPetit,
                          ),
                          Text(
                            '$age',
                            style: numberStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RoundIcon(
                                  icons: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 1) age--;
                                    });
                                  },
                                ),
                                RoundIcon(
                                  icons: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ])
                        ])))
          ])
          ),
CalculateButtom(
    titleButt: 'CALCULATE',
            onTap: () {
              Calculate calculate=
              Calculate(height: height, weight: weight);
              Navigator.of(context).push(
                MaterialPageRoute(
                            builder: (_) => SecondePage(
                          bmiResult: calculate.getBMIResult(),
                          resultText: calculate.getResult(),
                          interpretation: calculate.getInterpretation(),
                            )
                )
              );
            }
),
        ]));
  }
}
