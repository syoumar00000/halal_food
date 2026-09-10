import 'package:flutter/material.dart';

class SmartCounter extends StatelessWidget {
  final int selectedQuantity;
  final ValueChanged<int> onQuantityChanged;

  const SmartCounter({
    super.key,
    required this.selectedQuantity,
    required this.onQuantityChanged,
  });

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
          GestureDetector(
            onTap: () {
              if (selectedQuantity > 1) onQuantityChanged(selectedQuantity - 1);
            },
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.all(2),
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
          Text(
            "$selectedQuantity",
            style: const TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => onQuantityChanged(selectedQuantity + 1),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Color(0xfff45a08),
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
