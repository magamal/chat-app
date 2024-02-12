import 'package:flutter/material.dart';

class ImTitleText extends StatelessWidget {
  final String text;

  const ImTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 0.10,
        letterSpacing: 0.10,
      ),
    );
  }
}
