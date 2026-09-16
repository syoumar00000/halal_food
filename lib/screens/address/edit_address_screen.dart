import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Add Address"),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 150,
              width: KscreenWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                child: Image.asset("assets/icons/earth.png", fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
