import 'package:flutter/material.dart';
import 'package:h_food/screens/cart/cart_screen.dart';

addToCartAlert(BuildContext context, String title) {
  final snackBar = SnackBar(
    backgroundColor: Color(0xfff45a08),
    duration: Duration(seconds: 8),
    content: Text(
      "$title added to cart.",
      style: TextStyle(color: Color(0xffffffff)),
    ),
    action: SnackBarAction(
      backgroundColor: Color(0xff303030).withAlpha(58),
      textColor: Color(0xffffffff),
      label: "view cart",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
