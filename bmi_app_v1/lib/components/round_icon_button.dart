import 'package:flutter/material.dart';

class RoundIconButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;

  const RoundIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.onLongPress,
    this.iconColor = Colors.white,
    this.iconSize = 30.0,
    this.backgroundColor = const Color(0xFF1D1E33),
  });

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  bool isPressed = false;

  void _startContinuousAction() async {
    setState(() {
      isPressed = true;
    });

    while (isPressed) {
      widget.onLongPress();
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  void _stopContinuousAction() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Set button size relative to screen width, but with a maximum size limit
    double buttonSize = screenWidth * 0.12;
    double maxButtonSize =
        80.0; // Maximum size (in pixels) for web or larger screens
    buttonSize = buttonSize > maxButtonSize ? maxButtonSize : buttonSize;

    // Set icon size based on button size
    double iconSize = buttonSize * 0.35;

    return GestureDetector(
      onTap: widget.onTap,
      onLongPressStart: (_) => _startContinuousAction(),
      onLongPressEnd: (_) => _stopContinuousAction(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        constraints: BoxConstraints.tightFor(
          width: buttonSize,
          height: buttonSize,
        ),
        decoration: BoxDecoration(
          color: isPressed
              ? widget.backgroundColor.withOpacity(0.7)
              : widget.backgroundColor,
          shape: BoxShape.circle,
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Icon(
            widget.iconData,
            color: widget.iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
