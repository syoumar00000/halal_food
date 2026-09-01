import 'package:flutter/material.dart';

class SlideIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  const SlideIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < itemCount; i++)
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: 12,
            width: currentIndex == i ? 35 : 12,
            decoration: BoxDecoration(
              color: currentIndex == i ? Color(0xfff45a08) : Color(0xff727272),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
      ],
    );
  }
}
