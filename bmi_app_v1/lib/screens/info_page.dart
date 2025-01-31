import 'package:flutter/material.dart';

import '../components/reusable_button.dart';
import '../constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final basePadding = screenWidth * 0.05;
    final headerFontSize = 24 * textScale;
    final bodyFontSize = 16 * textScale;

    return Scaffold(
      appBar: AppBar(
        title: const Text('What is BMI?'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Body Mass Index (BMI)',
              style: TextStyle(
                fontSize: headerFontSize,
                color: infoHeading,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Body Mass Index (BMI) is a value derived from the mass (weight) and height of a person. '
              'It is defined as the body mass divided by the square of the body height, and is universally '
              'expressed in units of kg/m², resulting from mass in kilograms and height in meters.',
              style: TextStyle(fontSize: bodyFontSize),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'BMI Categories:',
              style: TextStyle(
                fontSize: headerFontSize * 0.75,
                fontWeight: FontWeight.bold,
                color: infoHeading,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              '''
- Underweight: BMI < 18.5
- Normal weight: 18.5 ≤ BMI < 24.9
- Overweight: 25 ≤ BMI < 29.9
- Obesity: BMI ≥ 30
              ''',
              style: TextStyle(fontSize: bodyFontSize),
            ),
            const Spacer(),
            ReusableButton(
              buttonText: 'Back to Calculator',
              onPressed: () {
                Navigator.pop(context);
              },
              screenWidth: screenWidth,
              basePadding: basePadding,
              screenHeight: screenHeight,
              bodyFontSize: 21,
            ),
          ],
        ),
      ),
    );
  }
}
