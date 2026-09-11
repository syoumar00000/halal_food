import 'package:flutter/material.dart';
import 'package:h_food/screens/account/widgets/account_header.dart';
import 'package:h_food/widgets/header/simple_header.dart';
import 'package:h_food/widgets/navigation/main_bottom_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [AccountHeader(title: "Profile")]),
      bottomNavigationBar: MainBottomBar(currentIndex: 3),
    );
  }
}
