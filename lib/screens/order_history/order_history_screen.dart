import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  bool isSignInActive = true;
  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    const Color inactiveGrey = Color(0xff727272);
    const Color lineGrey = Color(0xffe0e0e0);

    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Order History"),
          SizedBox(height: 15),
          Container(
            height: 50,
            width: KscreenWidth(context) - 40,
            decoration: BoxDecoration(
              color: Color(0xff303030).withAlpha(50),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
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
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: isSignInActive
                            ? BorderRadius.circular(30)
                            : null,
                        color: isSignInActive
                            ? brandOrange
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "Ongoing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSignInActive
                                ? Color(0xffffffff)
                                : Color(0xff303030),
                          ),
                        ),
                      ),
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
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: !isSignInActive
                            ? BorderRadius.circular(30)
                            : null,
                        color: !isSignInActive
                            ? brandOrange
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "History",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: !isSignInActive
                                ? Color(0xffffffff)
                                : Color(0xff303030),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /* Row(
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
                                color: isSignInActive
                                    ? brandOrange
                                    : inactiveGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 3,
                              color: isSignInActive
                                  ? brandOrange
                                  : lineGrey, // Orange si actif, gris si inactif
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
                                color: !isSignInActive
                                    ? brandOrange
                                    : inactiveGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 3,
                              color: !isSignInActive
                                  ? brandOrange
                                  : lineGrey, // Orange si actif, gris si inactif
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), */
        ],
      ),
    );
  }
}
