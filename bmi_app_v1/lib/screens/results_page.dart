import '../components/reusable_button.dart';
import 'package:flutter/material.dart';
import '../components/result_card.dart';
import '../constants.dart';
import 'info_page.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

  Color getResultColor() {
    if (resultText.toLowerCase() == 'normal weight') {
      return Colors.green;
    } else if (resultText.toLowerCase() == 'overweight') {
      return Colors.red;
    } else {
      return Colors.blue; // For underweight
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final basePadding = screenWidth * 0.05;
    final bodyFontSize = 21 * textScale;
    final resultTextStyle = TextStyle(
      color: getResultColor(),
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(),
                ),
              );
            },
            icon: Icon(
              Icons.info_outline_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result!',
              style: titleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ResultCard(
              color: activeCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: resultBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: resultBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ReusableButton(
            buttonText: 'Re-Calculate',
            onPressed: () {
              Navigator.of(context).pop();
            },
            screenWidth: screenWidth,
            basePadding: basePadding,
            screenHeight: screenHeight,
            bodyFontSize: bodyFontSize,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
