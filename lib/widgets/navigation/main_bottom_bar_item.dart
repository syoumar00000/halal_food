import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';

class MainBottomBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Widget icon;
  final String title;
  final Function onPressed;
  const MainBottomBarItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        duration: Duration(milliseconds: 350),
        child: index != currentIndex
            ? TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                  padding: EdgeInsets.all(0),
                  iconColor: Color(0xff303030),
                  iconSize: 20,
                ),
                onPressed: () {
                  onPressed(index);
                },
                key: ValueKey<bool>(index == currentIndex),
                child: icon,
              )
            : TextButton(
                key: ValueKey(index == currentIndex),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  iconColor: Color(0xfff45a08),
                  iconSize: 20,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [icon, KSpaceW(0.5), Icon(Icons.circle, size: 8)],
                ),
              ),
      ),
    );
  }
}
