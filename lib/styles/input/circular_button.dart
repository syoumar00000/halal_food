import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double size;
  final Function() onPressed;
  final Color color;
  final Widget icon;
  const CircularButton({
    super.key,
    this.size=30,
    required this.onPressed,
    this.color = Colors.black,
    required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color,
          shape: CircleBorder()
        ),
        onPressed: onPressed,
         child:  Center(child: icon,)
         ),
    );
  }
}