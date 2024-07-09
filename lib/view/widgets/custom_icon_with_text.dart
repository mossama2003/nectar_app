import 'package:flutter/material.dart';

class CustomIconWithText extends StatelessWidget {
  const CustomIconWithText({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
  });

  final Widget icon;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
