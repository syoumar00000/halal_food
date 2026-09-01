  import 'package:flutter/material.dart';
import 'package:h_food/screens/authentication/widgets/content.dart';
import 'package:h_food/screens/authentication/widgets/static_header.dart';

  class SigninScreen extends StatefulWidget {
    const SigninScreen({super.key});

    @override
    State<SigninScreen> createState() => _SigninScreenState();
  }

  class _SigninScreenState extends State<SigninScreen> {
    bool isSignInActive = true;

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
              children: [
                // 1. LE FOND ORANGE AVEC LOGO
              StaticHeader(),
                // 2. LE PANNEAU BLANC INTERACTIF
                Content(),
              ],
            ),
          ),
      );
    }
    }

