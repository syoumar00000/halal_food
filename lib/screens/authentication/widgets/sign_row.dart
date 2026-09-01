import 'package:flutter/material.dart';

class SignRow extends StatefulWidget {
  const SignRow({super.key});

  @override
  State<SignRow> createState() => _SignRowState();
}

class _SignRowState extends State<SignRow> {
    bool isSignInActive = true;
  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
      const Color inactiveGrey = Color(0xff727272);
      const Color lineGrey = Color(0xffe0e0e0);
    return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // ONGLET SIGN IN
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignInActive = true; // Active le Sign In au clic
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: isSignInActive ? brandOrange : inactiveGrey ,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 3,
                                          color: isSignInActive ? brandOrange : lineGrey, // Orange si actif, gris si inactif
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ONGLET SIGN UP
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignInActive = false; // Active le Sign Up au clic
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: !isSignInActive ? brandOrange : inactiveGrey,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 3,
                                          color: !isSignInActive ? brandOrange : lineGrey, // Orange si actif, gris si inactif
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
  }
}