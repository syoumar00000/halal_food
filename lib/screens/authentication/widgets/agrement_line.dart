import 'package:flutter/material.dart';

class AgrementLine extends StatelessWidget {
  const AgrementLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Checkbox(
                                            value: false,
                                            onChanged: (value){},
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "I've read and agree with the ",
                                                style: TextStyle(
                                                  color: Color(0xff727272),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Terms \n and Conditions ",
                                                style: TextStyle(
                                                  color: Color(0xfff45a08),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "and the ",
                                                style: TextStyle(color: Color(0xff727272))
                                              ),
                                              TextSpan(
                                                text: "Privacy Policy",
                                                style: TextStyle(
                                                  color: Color(0xfff45a08),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ]
                                            ),
                                        ),
                                        ],
                                      ),
                                    );
  }
}