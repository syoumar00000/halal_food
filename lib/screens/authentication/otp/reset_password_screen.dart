import 'package:flutter/material.dart';
import 'package:h_food/screens/authentication/otp/widget/dialog_card.dart';
import 'package:h_food/screens/authentication/widgets/static_header.dart';
import 'package:h_food/screens/authentication/widgets/text_with_input_text.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StaticHeader(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
                color: Color(0xffffffff),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: KscreenWidth(context) - 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff303030),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Please enter your new password to continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff727272),
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextWithInputText(
                          label: "New Password",
                          icon: Icon(Icons.lock_outline),
                          hint: "enter your Password",
                          isPassword: true,
                          hideIcon: Icon(Icons.visibility_off),
                        ),
                        SizedBox(height: 10),
                        TextWithInputText(
                          label: "Confirm Password",
                          icon: Icon(Icons.lock_outline),
                          hint: "enter your Password",
                          isPassword: true,
                          hideIcon: Icon(Icons.visibility_off),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        DefaultButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(content: DialogCard()),
                          ),
                          label: "Confirm",
                          backgroundColor: Color(0xfff45a08),
                          foregroundColor: Color(0xffffffff),
                          width: double.infinity,
                          height: 48,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
