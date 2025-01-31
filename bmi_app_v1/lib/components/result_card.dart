import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  const ResultCard({
    super.key,
    required this.color,
    required this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: cardChild,
    );
  }
}
