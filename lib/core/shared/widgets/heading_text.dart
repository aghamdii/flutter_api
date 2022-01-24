import 'package:flutter/material.dart';

/// Widget used in headings

class HeadingText extends StatelessWidget {
  final String text;
  HeadingText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
