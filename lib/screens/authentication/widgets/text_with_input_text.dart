import 'package:flutter/material.dart';
import 'package:h_food/styles/input/outline_input.dart';

class TextWithInputText extends StatelessWidget {
  final String label;
  final Widget icon;
  final Widget? hideIcon;
  final String hint;
  final bool? isPassword;

  const TextWithInputText({
    super.key,
    required this.label,
    required this.icon,
    required this.hint,
    this.isPassword = false,
    this.hideIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff303030),
          ),
        ),
        const SizedBox(height: 5),
        OutlineInput(
          prefix: icon,
          hint: hint,
          suffix: isPassword == true ? hideIcon : null,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
