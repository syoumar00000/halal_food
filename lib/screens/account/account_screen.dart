import 'package:flutter/material.dart';
import 'package:h_food/screens/account/edit_account_screen.dart';
import 'package:h_food/screens/account/widgets/account_header.dart';
import 'package:h_food/screens/account/widgets/account_widget.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/widgets/navigation/main_bottom_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AccountHeader(title: "Profile"),
          SizedBox(height: 145),
          AccountWidget(
            isActive: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditAccountScreen()),
                // () => Navigator.pushNamed(context, "/signin-screen"),
              );
            },
            icon: Icons.edit,
            label: "Edit Profile",
          ),
          SizedBox(height: 5),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.replay_outlined,
            label: "Order History",
            onTap: () => Navigator.pushNamed(context, "/orderHistory-screen"),
          ),
          SizedBox(height: 6),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.credit_card,
            label: "Save Cards",
            onTap: () {},
          ),
          SizedBox(height: 6),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.location_on_outlined,
            label: "Save Addresses",
            onTap: () {},
          ),
          SizedBox(height: 6),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.sms_outlined,
            label: "Contact Us",
            onTap: () {},
          ),
          SizedBox(height: 6),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.info_outline,
            label: "About App",
            onTap: () => Navigator.pushNamed(context, "/about-screen"),
          ),
          SizedBox(height: 6),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 6),
          AccountWidget(
            isActive: true,
            icon: Icons.logout,
            label: "Log Out",
            onTap: () async {
              // Ouvre le dialogue et attend la réponse (true ou false)
              final bool? isWorking = await myDialog(context);

              if (isWorking == true) {
                print("L'utilisateur a cliqué sur OK !");
              } else {
                print("L'utilisateur a cliqué sur NO ou a fermé à côté.");
              }
            },
          ),
          SizedBox(height: 5),
        ],
      ),
      bottomNavigationBar: MainBottomBar(currentIndex: 3),
    );
  }

  myDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("Log Out")),
          content: Text(
            "Are you sure you want to Logout? you'll need to Login again to use the App",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            DefaultButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              label: "Cancel",
              backgroundColor: Color(0xffffffff),
              foregroundColor: Color(0xfff45a08),
              height: 38,
              width: 100,
            ),
            SizedBox(width: 10),
            DefaultButton(
              onPressed: () => Navigator.pushNamed(context, "/signin-screen"),
              label: "Logout",
              backgroundColor: Color(0xfff45a08),
              foregroundColor: Color(0xffffffff),
              height: 38,
              width: 100,
            ),
          ],
        );
      },
    );
  }
}
