import 'package:flutter/material.dart';
import 'package:h_food/screens/locate/delivery_address_screen.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class LocateScreen extends StatelessWidget {
  const LocateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: KscreenHeight(context) / 3,
              width: KscreenWidth(context) / 1.5,
              child: Image.asset("assets/icons/earth.png", fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              "Allow Location",
              style: TextStyle(
                color: Color(0xff303030),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "we need your permission to access your location.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff727272), fontSize: 20),
            ),
            SizedBox(height: 20),
            Spacer(),
            DefaultButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/delivery-address-screen");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryAddressScreen(),
                  ),
                );
              },
              label: "Allow Location",
              backgroundColor: Color(0xfff45a08),
              foregroundColor: Color(0xffffffff),
              height: 48,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Color(0xfff45a08)),
              ),
              child: DefaultButton(
                onPressed: () {},
                label: "Maybe Later",
                backgroundColor: Color(0xffffffff),
                foregroundColor: Color(0xfff45a08),
                height: 48,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
