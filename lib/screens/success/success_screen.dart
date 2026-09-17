import 'package:flutter/material.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Confirmation"),
          SizedBox(height: 40),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.check_circle_outline_outlined,
              size: 200,
              color: Color(0xfff45a08),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Successfull !",
            style: TextStyle(
              color: Color(0xfff45a08),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Your Order Number is ",
                  style: TextStyle(
                    color: Color(0xff727272),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "#125486",
                  style: TextStyle(
                    color: Color(0xfff45a08),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: DefaultButton(
              onPressed: () {},
              label: "Track Order",
              backgroundColor: Color(0xfff45a08),
              foregroundColor: Color(0xffffffff),
              height: 48,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: DefaultButton(
              onPressed: () async {
                // Ouvre le dialogue et attend la réponse (true ou false)
                final bool? isWorking = await myDialog(context);

                if (isWorking == true) {
                  print("L'utilisateur a cliqué sur OK !");
                } else {
                  print("L'utilisateur a cliqué sur NO ou a fermé à côté.");
                }
              },
              label: "Cancel Order",
              backgroundColor: Color(0xffffffff),
              foregroundColor: Color(0xfff45a08),
              height: 48,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  myDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/icons/fail.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
          content: Text(
            "Are you sure you want to Cancel Order?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              children: [
                DefaultButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);

                    // Ouvre le dialogue et attend la réponse (true ou false)
                    final bool? isWorking = await validatedDialog(context);

                    if (isWorking == true) {
                      print("L'utilisateur a cliqué sur OK !");
                    } else {
                      print("L'utilisateur a cliqué sur NO ou a fermé à côté.");
                    }
                  },
                  label: "Yes, Cancel Order",
                  backgroundColor: Color(0xfff45a08),
                  foregroundColor: Color(0xffffffff),
                  height: 38,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "No, Go Back",
                    style: TextStyle(
                      color: Color(0xfff45a08),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  validatedDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 100,
                color: Color(0xfff45a08),
              ),
            ),
          ),
          content: Text(
            "Your Order has been Cancelled successfully.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            DefaultButton(
              onPressed: () => Navigator.pushNamed(context, "/home-screen"),
              label: "Back To Home",
              backgroundColor: Color(0xfff45a08),
              foregroundColor: Color(0xffffffff),
              height: 38,
              width: double.infinity,
            ),
          ],
        );
      },
    );
  }
}
