import '../constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;
  const IconContent({
    super.key,
    required this.icon,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15.0),
        Text(
          lable,
          style: labelTextStyle,
        )
      ],
    );
  }
}
