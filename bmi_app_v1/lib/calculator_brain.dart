import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  double _bmi;

  CalculatorBrain({
    required this.weight,
    required this.height,
  }) : _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal weight';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your weight is above normal. Exercise and a balanced diet can help.';
    } else if (_bmi >= 18.5) {
      return 'Your weight is normal. Maintain a healthy lifestyle. Good Job!';
    } else {
      return 'Your weight is below normal. A nutrient-rich diet can help.';
    }
  }
}
