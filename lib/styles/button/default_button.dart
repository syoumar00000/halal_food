import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
      this.width,
     required this.height

    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: width, // Prend proprement toute la largeur disponible sans forcer
            height: height, // Une hauteur standard et confortable pour les pouces
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:  Text(
                  label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                  );
  }
}