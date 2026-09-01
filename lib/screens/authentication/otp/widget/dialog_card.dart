import 'package:flutter/material.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KscreenWidth(context) - 60,
      height: KscreenHeight(context) / 2.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/icons/check.png",
            width: 130,
            height: 130,
            color: Color(0xfff45a08),
          ),
          SizedBox(height: 10),
          Text(
            "Password updated succesfully!",
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "Your password has been changed successfully.\n",
              style: TextStyle(color: Color(0xff727272), fontSize: 15),
              children: [
                TextSpan(
                  text: "your account is now more secure!",
                  style: TextStyle(color: Color(0xff727272), fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          DefaultButton(
            onPressed: () => Navigator.pushNamed(context, "/locate-screen"),
            label: "Go To Home",
            backgroundColor: Color(0xfff45a08),
            foregroundColor: Color(0xffffffff),
            width: double.infinity,
            height: 48,
          ),
          Transform.translate(
            offset: Offset(135, -350),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(
                  height: 35,
                  width: 35,
                  "assets/icons/cancel.png",
                  fit: BoxFit.cover,
                  color: Color(0xfff45a08),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
