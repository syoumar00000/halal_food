import 'package:flutter/material.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Saved Card"),
          Expanded(
            child: SingleChildScrollView(child: Column(children: [

              ],
            )),
          ),
        ],
      ),
    );
  }
}
