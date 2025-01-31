import 'package:flutter/material.dart';

import '../screens/info_page.dart';
import '../screens/input_page.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('BMI CALCULATOR'),
      leading: IconButton(
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
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InputPage(),
              ),
            );
          },
          icon: Icon(
            Icons.refresh_rounded,
            size: 30,
          ),
        ),
      ],
    );
  }
}
