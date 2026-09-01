import 'package:flutter/material.dart';

class DividerBloc extends StatelessWidget {
  const DividerBloc({super.key});

  @override
  Widget build(BuildContext context) {
    const Color inactiveGrey = Color(0xff727272);
    return Column(
      children: [
        Divider(color: Colors.grey.shade300, thickness: 2),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              "Or continue with",
              style: TextStyle(color: inactiveGrey, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
