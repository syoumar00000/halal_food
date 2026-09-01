import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0xffffffff).withAlpha(85),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Icon(icon, color: Color(0xffffffff), size: 25)),
    );
  }
}
