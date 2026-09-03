import 'package:flutter/material.dart';

class OngletRow extends StatelessWidget {
  final String label;
  final String actionText;
  const OngletRow({super.key, required this.label, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff727272),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            actionText,
            style: TextStyle(color: Color(0xfff45a08), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
