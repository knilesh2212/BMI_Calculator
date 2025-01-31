import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double screenWidth;
  final double basePadding;
  final double screenHeight;
  final double bodyFontSize;
  final Color buttonColor;

  const ReusableButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.screenWidth,
    required this.basePadding,
    required this.screenHeight,
    required this.bodyFontSize,
    this.buttonColor = bottomContainerColor, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Center(
        child: SizedBox(
          width: screenWidth * 0.75, // 90% of screen width
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              padding: EdgeInsets.symmetric(
                horizontal: basePadding,
                vertical: screenHeight * 0.015,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: bodyFontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
