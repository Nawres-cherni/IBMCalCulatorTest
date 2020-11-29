import 'dart:math';

class Calculate {
  final int height;
  final int weight;
  double resultbmi;

  Calculate({this.height, this.weight});

  String getBMIResult() {
    resultbmi = weight / pow(height / 100, 2);
    return resultbmi.toStringAsFixed(1);
  }

  String getResult() {
    if (resultbmi > 30)
      return 'Obesity';
    else if (resultbmi > 25)
      return 'Overweight';
    else if (resultbmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (resultbmi > 30)
      return 'Ohh No! You have much more weight than that of a normal person. Consult a doctor immediately!!';
    else if (resultbmi > 25)
      return 'Ahh! Your body weight is more than normal. Try to exercise more and maintain a healthy diet.';
    else if (resultbmi > 18.5)
      return 'WOW! You have a perfect weight. Let\'s maintain this.';
    else
      return 'Ohh! Your body weight is less than normal. Try to eat more and live a healthy life.';
  }
}
