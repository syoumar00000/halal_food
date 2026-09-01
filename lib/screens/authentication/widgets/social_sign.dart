import 'package:flutter/material.dart';
import 'package:h_food/styles/input/circular_button.dart';
import 'package:ionicons/ionicons.dart';

class SocialSign extends StatelessWidget {
  const SocialSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularButton(
          size: 60,
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Ionicons.logo_google, size: 20, color: Colors.red),
        ),
        SizedBox(width: 15),
        CircularButton(
          size: 60,
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Ionicons.logo_facebook, size: 20, color: Colors.lightBlue),
        ),
        SizedBox(width: 15),
        CircularButton(
          size: 60,
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Ionicons.logo_apple, size: 20, color: Colors.black87),
        ),
      ],
    );
  }
}
