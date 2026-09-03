import 'package:flutter/material.dart';

class SmartCounter extends StatefulWidget {
  const SmartCounter({super.key});

  @override
  State<SmartCounter> createState() => _SmartCounterState();
}

class _SmartCounterState extends State<SmartCounter> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff727272).withAlpha(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // BOUTON MOINS
          GestureDetector(
            onTap: () {
              if (value > 1) {
                setState(() {
                  value--;
                });
              }
            },
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.remove,
                color: Color(0xff303030),
                size: 18,
              ),
            ),
          ),

          // TEXTE DE LA VALEUR
          Text(
            "$value",
            style: const TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // BOUTON PLUS
          GestureDetector(
            onTap: () {
              setState(() {
                value++;
              });
            },
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Color(0xfff45a08), // Orange signature
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
