import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  final String text;
  PostTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
