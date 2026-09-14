import 'package:flutter/material.dart';
import 'package:h_food/screens/account/widgets/account_widget.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "About App"),
          SizedBox(height: 20),
          AccountWidget(
            label: "FAQ",
            onTap: () => Navigator.pushNamed(context, "/faq-screen"),
            isActive: false,
          ),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
          AccountWidget(label: "Privacy Policy", onTap: () {}, isActive: false),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
          AccountWidget(label: "Terms Of Use", onTap: () {}, isActive: false),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
          AccountWidget(label: "Facebook", onTap: () {}, isActive: false),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
          AccountWidget(label: "Instagram", onTap: () {}, isActive: false),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
          AccountWidget(label: "Twitter", onTap: () {}, isActive: false),
          SizedBox(height: 5),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
