import 'package:flutter/material.dart';

class TextOnglet extends StatelessWidget {
  final String label;
  const TextOnglet({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Color(0xff303030),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
