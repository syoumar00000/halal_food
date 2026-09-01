import 'package:flutter/material.dart';

class OptionBloc extends StatelessWidget {
  const OptionBloc({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    const Color inactiveGrey = Color(0xff727272);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: false, onChanged: (value) {}),
            ),
            SizedBox(width: 4),
            Text("Remember me", style: TextStyle(color: inactiveGrey)),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/forget-screen");
          },
          child: Text("Forget password?", style: TextStyle(color: brandOrange)),
        ),
      ],
    );
  }
}
