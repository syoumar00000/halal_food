import 'package:flutter/material.dart';
import 'package:h_food/screens/authentication/widgets/static_header.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
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
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            "Enter Verification code",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff303030),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text: "A 4-digit code was sent to\n",
                              style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 23,
                              ),
                              children: [
                                TextSpan(
                                  text: "takef_dev@earth_company.sn",
                                  style: TextStyle(
                                    color: Color(0xfff45a08),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        DefaultButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "/reset-password-screen",
                            );
                          },
                          label: "Send Code",
                          backgroundColor: Color(0xfff45a08),
                          foregroundColor: Color(0xffffffff),
                          width: double.infinity,
                          height: 48,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text: "D'ont receive code?",
                              style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: " Resend",
                                  style: TextStyle(
                                    color: Color(0xfff45a08),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
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
