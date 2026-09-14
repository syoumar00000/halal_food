import 'package:flutter/material.dart';
import 'package:h_food/screens/about/about_screen.dart';
import 'package:h_food/screens/authentication/otp/forget_screen.dart';
import 'package:h_food/screens/authentication/otp/reset_password_screen.dart';
import 'package:h_food/screens/authentication/otp/verify_code_screen.dart';
import 'package:h_food/screens/authentication/signin_screen.dart';
import 'package:h_food/screens/faq/faq_screen.dart';
import 'package:h_food/screens/home/home_screen.dart';
import 'package:h_food/screens/locate/locate_screen.dart';
import 'package:h_food/screens/wishlist/wishlist_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/signin-screen": (BuildContext context) => SigninScreen(),
  "/about-screen": (BuildContext context) => AboutScreen(),
  "/faq-screen": (BuildContext context) => FaqScreen(),
  "/forget-screen": (BuildContext context) => ForgetScreen(),
  "/verify-code-screen": (BuildContext context) => VerifyCodeScreen(),
  "/reset-password-screen": (BuildContext context) => ResetPasswordScreen(),
  "/locate-screen": (BuildContext context) => LocateScreen(),
  "/home-screen": (BuildContext context) => HomeScreen(),
  //"/category" : (BuildContext context) => CategoryScreen(),
  "/wishlist": (BuildContext context) => WishlistScreen(),
  //"/address-form-screen" : (BuildContext context) => AddressFormScreen(),
  // "/delivery-address-screen": (BuildContext context) => DeliveryAddressScreen(markers: markers, address: address, controller: controller)
};
